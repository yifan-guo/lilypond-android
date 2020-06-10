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

#ifndef LY_SMOB_LIST_HH
#define LY_SMOB_LIST_HH

#include "ly-scm-list.hh"

#include "smobs.hh"

// This presents a SCM list as a C++ list of pointers to the template type.
// N.B. Dereferencing an iterator involves a dynamic_cast (via unsmob).
template <class T>
using ly_smob_list = ly_scm_list_t<T *>;

// Refer to a SCM as a ly_scm_list, maintaining constness.
template <class T>
inline const ly_smob_list<T> &
as_ly_smob_list (const SCM &s)
{
  return as_ly_scm_list_t<T *> (s);
}

// Refer to a SCM as a ly_scm_list, maintaining mutability.
template <class T>
inline ly_smob_list<T> &
as_ly_smob_list (SCM &s)
{
  return as_ly_scm_list_t<T *> (s);
}

#endif /* LY_SMOB_LIST_HH */
