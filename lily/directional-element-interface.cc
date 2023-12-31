/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1999--2020 Han-Wen Nienhuys <hanwen@xs4all.nl>

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

#include "directional-element-interface.hh"
#include "../flower/warn.hh"
#include "grob.hh"

Direction
get_grob_direction (Grob *me)
{
  SCM d = get_property (me, "direction");
  if (scm_is_eq (d, ly_symbol2scm ("calculation-in-progress")))
    {
      programming_error ("Grob direction requested while calculation in"
                         " progress.");
      return UP;
    }
  if (!is_scm<Direction> (d))
    return CENTER;

  return from_scm<Direction> (d);
}

void
set_grob_direction (Grob *me, Direction d)
{
  SCM sd = to_scm (d);
  set_property (me, "direction", sd);
}
