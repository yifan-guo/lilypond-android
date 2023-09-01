/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 2004--2020 Han-Wen Nienhuys <hanwen@xs4all.nl>

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

#include "music-wrapper-iterator.hh"

#include "context.hh"
#include "dispatcher.hh"
#include "input.hh"
#include "../flower/international.hh"
#include "lily-guile.hh"
#include "music-sequence.hh"
#include "music.hh"
#include "../flower/warn.hh"

class Quote_iterator final : public Music_wrapper_iterator
{
public:
  Quote_iterator () = default;
  Moment vector_moment (vsize idx) const;
  Context_handle quote_handle_;

  Moment start_moment_;
  Moment stop_moment_;
  SCM event_vector_ = SCM_EOL;
  vsize event_idx_ = VPOS;
  vsize end_idx_ = 0;

  SCM transposed_musics_ = SCM_EOL;

  DECLARE_SCHEME_CALLBACK (constructor, ());
  bool quote_ok () const;
  bool accept_music_type (Stream_event *, bool is_cue = true) const;

protected:
  void derived_mark () const override;
  void create_children () override;
  void create_contexts () override;
  Moment pending_moment () const override;
  void process (Moment) override;
  void do_quit () override;
};

void
Quote_iterator::do_quit ()
{
  Music_wrapper_iterator::do_quit ();
  quote_handle_.set_context (0);
}

bool
Quote_iterator::accept_music_type (Stream_event *ev, bool is_cue) const
{
  SCM accept = SCM_EOL;
  // Cue notes use the quotedCueEventTypes property, otherwise (and as fallback
  // for cue notes if quotedCueEventTypes is not set) use quotedEventTypes
  if (is_cue)
    accept = get_property (get_context (), "quotedCueEventTypes");
  if (scm_is_null (accept))
    accept = get_property (get_context (), "quotedEventTypes");

  for (; scm_is_pair (accept); accept = scm_cdr (accept))
    {
      if (ev->internal_in_event_class (scm_car (accept)))
        return true;
    }
  return false;
}

void
Quote_iterator::derived_mark () const
{
  Music_wrapper_iterator::derived_mark ();
  scm_gc_mark (transposed_musics_);
}

vsize
binsearch_scm_vector (SCM vec, SCM key, bool (*is_less) (SCM a, SCM b))
{
  vsize lo = 0;
  vsize hi = scm_c_vector_length (vec);

  /* binary search */
  do
    {
      vsize cmp = (lo + hi) / 2;

      SCM when = scm_caar (scm_c_vector_ref (vec, cmp));
      bool result = (*is_less) (key, when);
      if (result)
        hi = cmp;
      else
        lo = cmp;
    }
  while (hi - lo > 1);

  return lo;
}

void
Quote_iterator::create_children ()
{
  Music_wrapper_iterator::create_children ();

  event_vector_ = get_property (get_music (), "quoted-events");
}

void
Quote_iterator::create_contexts ()
{
  Music_wrapper_iterator::create_contexts ();

  Context *cue_context = 0;

  SCM name = get_property (get_music (), "quoted-context-type");
  if (scm_is_symbol (name))
    {
      SCM id = get_property (get_music (), "quoted-context-id");
      std::string c_id = robust_scm2string (id, "");
      cue_context = get_context ()->find_create_context (CENTER,
                                                         name, c_id, SCM_EOL);
      if (!cue_context)
        {
          warning (_f ("cannot find or create context: %s",
                       Context::diagnostic_id (name, c_id).c_str ()));
        }
    }

  if (!cue_context)
    cue_context = get_context ()->get_default_interpreter ();
  quote_handle_.set_context (cue_context);
}

bool
Quote_iterator::quote_ok () const
{
  return (event_idx_ != VPOS
          && scm_is_vector (event_vector_)
          && event_idx_ <= end_idx_

          /*
            Don't quote the grace notes leading to an unquoted note.
          */
          && vector_moment (event_idx_).main_part_ < stop_moment_.main_part_);
}

Moment
Quote_iterator::pending_moment () const
{
  Moment m = Music_wrapper_iterator::pending_moment ();

  /*
    In case event_idx_ < 0, we're not initted yet, and the wrapped
    music expression determines the starting moment.
  */
  if (quote_ok ())
    m = std::min (m, vector_moment (event_idx_) - start_moment_);

  return m;
}

Moment
Quote_iterator::vector_moment (vsize idx) const
{
  SCM entry = scm_c_vector_ref (event_vector_, idx);
  return *unsmob<Moment> (scm_caar (entry));
}

void
Quote_iterator::process (Moment m)
{
  // process the wrapped music, if any remains
  {
    const auto &pm = Music_wrapper_iterator::pending_moment ();
    if (pm < Moment (Rational::infinity ()))
      Music_wrapper_iterator::process (m);
  }

  if (!scm_is_vector (event_vector_))
    return;

  if (event_idx_ == VPOS)
    {
      event_idx_ = binsearch_scm_vector (event_vector_,
                                         get_context ()->now_mom ().smobbed_copy (),
                                         &moment_less);
      start_moment_ = get_context ()->now_mom () - music_start_mom ();
      stop_moment_ = start_moment_ + get_music ()->get_length ();

      end_idx_ = binsearch_scm_vector (event_vector_,
                                       stop_moment_.smobbed_copy (),
                                       &moment_less);
    }

  m += start_moment_;
  while (event_idx_ <= end_idx_)
    {
      Moment em = vector_moment (event_idx_);
      if (em > m)
        return;

      if (em == m)
        break;

      event_idx_++;
    }

  if (quote_ok ())
    {
      SCM entry = scm_c_vector_ref (event_vector_, event_idx_);
      Pitch *quote_pitch = unsmob<Pitch> (scm_cdar (entry));

      /*
        The pitch that sounds when written central C is played.
      */
      Pitch temp_pitch;
      Pitch *me_pitch = unsmob<Pitch> (get_property (get_music (), "quoted-transposition"));
      if (!me_pitch)
        me_pitch = unsmob<Pitch> (get_property (get_context (), "instrumentTransposition"));
      else
        {
          // We are not going to win a beauty contest with this one,
          // but it is slated for replacement and touches little code.
          // quoted-transposition currently has a different sign
          // convention than instrumentTransposition
          temp_pitch = me_pitch->negated ();
          me_pitch = &temp_pitch;
        }
      SCM cid = get_property (get_music (), "quoted-context-id");
      bool is_cue = scm_is_string (cid) && (ly_scm2string (cid) == "cue");

      for (SCM s = scm_cdr (entry); scm_is_pair (s); s = scm_cdr (s))
        {
          SCM ev_acc = scm_car (s);

          Stream_event *ev = unsmob<Stream_event> (scm_car (ev_acc));
          if (!ev)
            programming_error ("no music found in quote");
          else if (accept_music_type (ev, is_cue))
            {
              /* create a transposed copy if necessary */
              if (quote_pitch || me_pitch)
                {
                  Pitch qp, mp;
                  if (quote_pitch)
                    qp = *quote_pitch;
                  if (me_pitch)
                    mp = *me_pitch;

                  Pitch diff = pitch_interval (mp, qp);
                  ev = ev->clone ();
                  ev->make_transposable ();
                  ev->transpose (diff);
                  transposed_musics_ = scm_cons (ev->unprotect (), transposed_musics_);
                }
              quote_handle_.get_context ()->event_source ()->broadcast (ev);
            }
        }

      event_idx_++;
    }
}

IMPLEMENT_CTOR_CALLBACK (Quote_iterator);
