/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1996--2020 Han-Wen Nienhuys <hanwen@xs4all.nl>

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

#ifndef INTERVAL_TCC
#define INTERVAL_TCC

#include <cassert>

#include "interval.hh"
#include "std-string.hh"

// MacOS 10.3 problems:
// #include <cmath>

template<class T>
int
_Interval__compare (const Interval_t<T> &a, Interval_t<T> const &b)
{
  if (a.at (LEFT) == b.at (LEFT) && a.at (RIGHT) == b.at (RIGHT))
    return 0;

  if (a.at (LEFT) <= b.at (LEFT) && a.at (RIGHT) >= b.at (RIGHT))
    return 1;

  if (a.at (LEFT) >= b.at (LEFT) && a.at (RIGHT) <= b.at (RIGHT))
    return -1;

  return -2;
}

template<class T>
int
Interval__compare (Interval_t<T> const &a, Interval_t<T> const &b)
{
  int i = _Interval__compare (a, b);
  if (i < -1)
    assert (false);
  return i;
}

template<class T>
void
Interval_t<T>::set_empty ()
{
  at (LEFT) = (T) infinity ();
  at (RIGHT) = (T) - infinity ();
}

template<class T>
void
Interval_t<T>::set_full ()
{
  at (LEFT) = (T) - infinity ();
  at (RIGHT) = (T) infinity ();
}

template<class T>
T
Interval_t<T>::length () const
{
  if (at (RIGHT) <= at (LEFT))
    return 0;
  else
    return at (RIGHT) - at (LEFT);
}

/* smallest Interval which includes *this and #h#  */
template<class T>
void
Interval_t<T>::unite (Interval_t<T> h)
{
  at (LEFT) = std::min (h.at (LEFT), at (LEFT));
  at (RIGHT) = std::max (h.at (RIGHT), at (RIGHT));
}

template<class T>
void
Interval_t<T>::intersect (Interval_t<T> h)
{
  at (LEFT) = std::max (h.at (LEFT), at (LEFT));
  at (RIGHT) = std::min (h.at (RIGHT), at (RIGHT));
}

template<class T>
std::string
Interval_t<T>::to_string () const
{
  if (is_empty ())
    return "[empty]";

  // Rely on argument-dependent lookup to find to_string for classes,
  // and import std::to_string to support basic types.
  using std::to_string;
  std::string s ("[");
  return s + to_string (at (LEFT)) + ',' + to_string (at (RIGHT)) + ']';
}

template<class T>
bool
Interval_t<T>::contains (T r) const
{
  return r >= at (LEFT) && r <= at (RIGHT);
}

#define INTERVAL__INSTANTIATE(T) struct Interval_t<T>;                  \
  template int Interval__compare (const Interval_t<T> &, Interval_t<T> const &)

#endif // INTERVAL_TCC
