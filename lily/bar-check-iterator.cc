/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 2001--2020  Han-Wen Nienhuys <hanwen@xs4all.nl>

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

#include "context.hh"
#include "input.hh"
#include "../flower/international.hh"
#include "music.hh"
#include "simple-music-iterator.hh"

/*
  Check bar checks. We do this outside the engravers so that you can
  race through the score using skipTypesetting to correct durations.
*/
class Bar_check_iterator final : Simple_music_iterator
{
public:
  void process (Moment) override;
  Bar_check_iterator ();
  DECLARE_SCHEME_CALLBACK (constructor, ());
};

IMPLEMENT_CTOR_CALLBACK (Bar_check_iterator);

Bar_check_iterator::Bar_check_iterator ()
{
}

void
Bar_check_iterator::process (Moment m)
{
  Simple_music_iterator::process (m);
  if (!m.to_bool ())
    {
      Context *tr = get_context ();

      SCM check = get_property (tr, "ignoreBarChecks");
      if (from_scm<bool> (check))
        return;

      SCM mp = get_property (tr, "measurePosition");
      SCM sync = get_property (tr, "barCheckSynchronize");

      Moment *where = unsmob<Moment> (mp);
      if (!where)
        return;

      if (where->main_part_)
        {
          bool warn = true;
          if (from_scm<bool> (sync))
            {
              SCM mp;
              tr = tr->where_defined (ly_symbol2scm ("measurePosition"), &mp);
              Moment zero;
              set_property (tr, "measurePosition", zero.smobbed_copy ());
            }
          else
            {
              SCM lf = get_property (tr, "barCheckLastFail");
              if (unsmob<Moment> (lf)
                  && *unsmob<Moment> (lf) == *where)
                warn = false;
              else
                set_property (tr, "barCheckLastFail", mp);
            }

          if (warn)
            warning (_f ("barcheck failed at: %s", where->to_string ()));
        }
    }
}
