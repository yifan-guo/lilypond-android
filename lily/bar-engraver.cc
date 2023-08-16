/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1997--2020 Han-Wen Nienhuys <hanwen@xs4all.nl>
  Jan Nieuwenhuizen <janneke@gnu.org>

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
#include "score-engraver.hh"
#include "../flower/warn.hh"
#include "item.hh"
#include "spanner.hh"

#include "translator.icc"

using std::vector;

/*
  generate bars. Either user ("|:"), or default (new measure)
*/
class Bar_engraver : public Engraver
{
public:
  TRANSLATOR_DECLARATIONS (Bar_engraver);

protected:
  void stop_translation_timestep ();
  void process_acknowledged ();

  void acknowledge_end_spanner (Grob_info);

private:
  void create_bar ();

  Item *bar_;
  vector<Spanner *> spanners_;
};

Bar_engraver::Bar_engraver (Context *c)
  : Engraver (c)
{
  bar_ = 0;
}

void
Bar_engraver::create_bar ()
{
  if (!bar_)
    {
      bar_ = make_item ("BarLine", SCM_EOL);
      SCM gl = get_property (this, "whichBar");
      if (!ly_is_equal (gl, get_property (bar_, "glyph")))
        set_property (bar_, "glyph", gl);
    }
}

/*
  Bar_engraver should come *after* any engravers that
  modify whichBar

  This is a little hairy : whichBar may be set by
  Repeat_acknowledge_engraver::process_music, which is at score
  context. This means that grobs could should be created after
  process_music. We do stuff process_acknowledged (), just to be
  on the safe side.
*/

void
Bar_engraver::process_acknowledged ()
{
  if (!bar_ && scm_is_string (get_property (this, "whichBar")))
    create_bar ();

  if (bar_)
    for (vsize i = 0; i < spanners_.size (); i++)
      spanners_[i]->set_bound (RIGHT, bar_);
}

/*
  lines may only be broken if there is a barline in all staves
*/
void
Bar_engraver::stop_translation_timestep ()
{
  if (!bar_)
    set_property (find_score_context (), "forbidBreak", SCM_BOOL_T);

  bar_ = 0;
  spanners_.clear ();
}

void
Bar_engraver::acknowledge_end_spanner (Grob_info gi)
{
  Grob *g = gi.grob ();

  if (from_scm<bool> (get_property (g, "to-barline")))
    spanners_.push_back (dynamic_cast<Spanner *> (g));
}

void
Bar_engraver::boot ()
{
  ADD_END_ACKNOWLEDGER (Bar_engraver, spanner);
}

ADD_TRANSLATOR (Bar_engraver,
                /* doc */
                "Create barlines.  This engraver is controlled through the"
                " @code{whichBar} property.  If it has no bar line to create,"
                " it will forbid a linebreak at this point.  This engraver"
                " is required to trigger the creation of clefs at the start"
                " of systems.",

                /* create */
                "BarLine ",

                /* read */
                "whichBar ",

                /* write */
                "forbidBreak "
               );
