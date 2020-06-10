/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 2020 Daniel Eble <dan@faithful.be>

  LilyPond is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  LilyPond is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef LY_SCM_LIST_HH
#define LY_SCM_LIST_HH

#include "lily-guile.hh"

#include <type_traits>

template <class T>
class ly_scm_list_t;

// This is an iterator for ly_scm_list_t<T>.  Dereferencing it yields a T.
template <class T, bool allow_mutation>
class ly_scm_iterator_t
{
private:
  using private_scm
    = typename std::conditional<allow_mutation, SCM, const SCM>::type;

  using const_iterator = ly_scm_iterator_t<T, false>;
  using iterator = ly_scm_iterator_t<T, true>;
  using other_iterator
    = typename std::conditional<allow_mutation, const_iterator, iterator>::type;

public:
  using difference_type = ssize_t;
  using value_type = T;
  using pointer
    = typename std::conditional<allow_mutation, T *, const T *>::type;
  using reference
    = typename std::conditional<allow_mutation, T &, const T &>::type;
  using iterator_category = std::forward_iterator_tag;

private:
  // either nullptr or a pointer to a SCM pair
  private_scm *it_ = nullptr;

  // Convert between iterator and const_iterator.
  //
  // Conversion from const_iterator to iterator is for use by a non-const
  // method of the owning container, in which context the relevance of the
  // const_iterator is only as a point of reference, not as a restriction on
  // mutating the container.
  explicit ly_scm_iterator_t (const other_iterator &other)
    : it_ (const_cast <private_scm *> (other.it_))
  {
  }

  // help maintain the invariant of it_ (n.b. doesn't avoid cycles)
  static const SCM *vet (const SCM *s)
  {
    return (s && ly_cheap_is_list (*s)) ? s : nullptr;
  }

  static SCM *vet (SCM *s)
  {
    return const_cast<SCM *> (vet (static_cast<const SCM *> (s)));
  }

protected:
  // for use by the owning container
  iterator erase_here ()
  {
    *it_ = scm_cdr (*it_);
    return iterator (it_); // referring to the next element
  }

  // for use by the owning container
  iterator insert_before_here (const value_type &value)
  {
    // splice in the new element; this invalidates all iterators pointing to
    // the current element (including this one)
    *it_ = scm_cons (to_scm (value), *it_);
    return *this; // referring to the new element
  }

  // Get the SCM equivalent of this iterator: either the current pair or
  // SCM_EOL.
  //
  // Note: If it were useful, we could make this a public method of iterator,
  // but not of const_iterator, because it would allow modifying the sequence.
  SCM self_scm () const
  {
    return it_ ? *it_ : SCM_EOL;
  }

public:
  ly_scm_iterator_t () = default;
  explicit ly_scm_iterator_t (SCM *s) : it_ (vet (s)) {}
  explicit ly_scm_iterator_t (const SCM *s) : it_ (vet (s)) {}
  ly_scm_iterator_t (const ly_scm_iterator_t &) = default;
  ly_scm_iterator_t &operator = (const ly_scm_iterator_t &) = default;
  ~ly_scm_iterator_t () = default;

  // an iterator can be converted to a const_iterator
  operator const_iterator () const
  {
    return const_iterator (*this);
  }

  // Dereference this iterator as SCM regardless of the value type.
  // This returns a reference to the car of the current pair.
  // Like operator *, the iterator must be valid to avoid undefined behavior.
  //
  // If you find yourself using this more than rarely, you might be better off
  // just working with SCM as the value type of your list.
  private_scm &dereference_scm () const
  {
    return *SCM_CARLOC (*it_);
  }

  // For SCM, we can return a reference to the car of the current pair.
  // Recommended range-based for loop syntax:
  //
  //     for (SCM &s : things)        // assigning to s changes the car
  //     for (SCM s : things)         // s is a mutable copy of the car
  //
  // Note that "const SCM &s" prevents modifying the immediate value of s, but
  // not non-immediate values (pairs, Smobs, etc.).
  //
  template <class T2 = T>
  typename std::enable_if<std::is_same<T2, SCM>::value, reference>::type
  operator * () const
  {
    // TODO: We wouldn't need the enable_if stuff if we had
    // a reference-preserving from_scm:
    //
    //     SCM &from_scm<SCM> (SCM &);
    //     const SCM &from_scm<SCM> (const SCM &);
    //
    return dereference_scm ();
  }

  // For value types other than SCM, conversion is built into dereferencing.
  // This can be very convenient, but there are limitations.
  //
  // The conversion happens every time the iterator is dereferenced.  In a
  // range-based for loop this poses no problem, but in a traditional loop, a
  // lack of concern may lead to inefficiency.
  //
  // The return is by value, not by reference, so it is not possible to change
  // the car of the current pair with *it = x.  In traditional loops, but not
  // in range-based loops, it.dereference_scm () = to_scm (x) is an option.
  //
  // For Smob pointers, the recommended range-based for loop syntax is this:
  //
  //     for (auto *s : smobs)        // the Smob can be changed via s
  //     for (const auto *s : smobs)  // the Smob can not be changed via s
  //
  // You can also make the pointer itself const if it concerns you.
  //
  // For immediate values, the recommended range-based for loop syntax is this:
  //
  //     for (auto v : values)        // v can be changed in the loop
  //     for (const auto &v : values) // v can't be changed in the loop
  //
  // Calling the robust version of from_scm () is not an option because
  // operator * takes no parameters.  TODO: It might be possible to provide a
  // uniform fallback value as a parameter of the list template.
  //
  template <class T2 = T>
  typename std::enable_if < !std::is_same<T2, SCM>::value, T >::type
  operator * () const
  {
    return from_scm<T> (dereference_scm ());
  }

  ly_scm_iterator_t &operator ++()
  {
    it_ = vet (SCM_CDRLOC (*it_));
    return *this;
  }

  bool operator == (const ly_scm_iterator_t &other) const
  {
    return scm_is_eq (self_scm (), other.self_scm ());
  }

  bool operator != (const ly_scm_iterator_t &other) const
  {
    return !(*this == other);
  }

  friend class ly_scm_list_t<T>;
  friend other_iterator;
};

// This is a wrapper around a SCM list.
//
// Dereferencing an iterator yields a T.
//
// The primary design goal is to fit the conventions of the STL as closely as
// possible, and where it is not possible, to make the differences obvious
// enough to avoid misleading.
template <class T>
class ly_scm_list_t
{
public:
  using const_iterator = ly_scm_iterator_t<T, false>;
  using iterator = ly_scm_iterator_t<T, true>;

  using value_type = T;

private:
  SCM head_ = SCM_EOL;

public:
  ly_scm_list_t () = default;

  explicit ly_scm_list_t (SCM &&s) : head_ (scm_is_pair (s) ? s : SCM_EOL) {}
  ly_scm_list_t (ly_scm_list_t &&) = default;
  ly_scm_list_t &operator = (ly_scm_list_t &&) = default;

  // Copying is not implemented.
  // For non-copying conversion from SCM &, see as_ly_scm_list_t ().
  ly_scm_list_t (const ly_scm_list_t &) = delete;
  ly_scm_list_t &operator = (const ly_scm_list_t &) = delete;

  const_iterator begin () const { return const_iterator (&head_); }
  const_iterator cbegin () const { return const_iterator (&head_); }
  const_iterator cend () const { return {}; }
  const_iterator end () const { return {}; }

  iterator begin () { return iterator (&head_); }
  iterator end () { return {}; }

  SCM begin_scm () { return head_; }

  void clear () { head_ = SCM_EOL; }

  bool empty () const { return head_ == SCM_EOL; }

  // erase the element at pos; return an iterator referring to the next
  // element; invalidate iterators referring to the deleted element
  iterator erase (const_iterator pos)
  {
    return iterator (pos).erase_here ();
  }

  void gc_mark () const { scm_gc_mark (head_); }

  // Insert value before pos.
  // Return an iterator referring to the inserted element.
  //
  // BEWARE the differences between this method and std::list::insert ().
  //
  // All iterators referring to the element that pos referred to (including
  // pos) are invalidated.  The caller can recover by incrementing the returned
  // iterator.
  //
  // This can not be used to insert before an iterator returned by end ();
  // however, it can be used to insert before an iterator that compares equal
  // to an iterator returned by end () which was obtained by calling begin ()
  // and advancing.
  iterator insert_before (const_iterator pos, const value_type &value)
  {
    return iterator (pos).insert_before_here (value);
  }

  // erase all elements for which the predicate returns true; return the number
  // of elements removed
  template <class UnaryPredicate>
  size_t remove_if (UnaryPredicate predicate)
  {
    size_t count = 0;
    auto tail = begin ();
    while (tail != end ())
      {
        if (!predicate (*tail))
          {
            ++tail;
          }
        else
          {
            tail = erase (tail);
            ++count;
          }
      }
    return count;
  }
};

// Refer to a SCM as a ly_scm_list_t<T>, maintaining constness.
template <class T>
inline const ly_scm_list_t<T> &
as_ly_scm_list_t (const SCM &s)
{
  // Check the sanity of the ly_scm_list_t<> design.
  static_assert (std::is_standard_layout<ly_scm_list_t<T>>::value, "");
  static_assert (sizeof (ly_scm_list_t<T>) == sizeof (SCM), "");

  return reinterpret_cast<const ly_scm_list_t<T> &> (s);
}

// Refer to a SCM as a ly_scm_list_t<T>, maintaining mutability.
template <class T>
inline ly_scm_list_t<T> &
as_ly_scm_list_t (SCM &s)
{
  const auto &cs = s;
  return const_cast<ly_scm_list_t<T> &> (as_ly_scm_list_t<T> (cs));
}

using ly_scm_list = ly_scm_list_t<SCM>;

// Refer to a SCM as a ly_scm_list, maintaining constness.
inline const ly_scm_list &
as_ly_scm_list (const SCM &s)
{
  return as_ly_scm_list_t<SCM> (s);
}

// Refer to a SCM as a ly_scm_list, maintaining mutability.
inline ly_scm_list &
as_ly_scm_list (SCM &s)
{
  return as_ly_scm_list_t<SCM> (s);
}

#endif /* LY_SCM_LIST_HH */
