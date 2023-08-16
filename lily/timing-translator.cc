/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1997--2020 Han-Wen Nienhuys <hanwen@xs4all.nl>

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

#include "timing-translator.hh"

#include "../flower/warn.hh"
#include "translator-group.hh"
#include "global-context.hh"
#include "moment.hh"
#include "lily-imports.hh"

void
Timing_translator::stop_translation_timestep ()
{
  if (from_scm<bool> (get_property (this, "timing"))
      && !from_scm<bool> (get_property (this, "skipBars")))
    {
      auto barleft = Moment (measure_length ()) - measure_position (context ());
      Moment now = now_mom ();

      if (barleft > Moment (0))
        {
          Moment nextmom = now + barleft;
          nextmom.grace_part_ = Rational (0);
          find_global_context ()->add_moment_to_process (nextmom);
        }
    }
}

void
Timing_translator::initialize ()
{
  Context *timing = unsmob<Context>
                    (Lily::ly_context_find (context ()->self_scm (), ly_symbol2scm ("Timing")));
  if (timing != context ())
    {
      context ()->add_alias (ly_symbol2scm ("Timing"));

      if (!timing)
        {
          programming_error ("Can't find Timing context template");
          timing = context ();
        }
    }

  SCM barnumber = get_property (timing, "currentBarNumber");
  if (!scm_is_integer (barnumber))
    barnumber = to_scm (1);
  set_property (context (), "currentBarNumber", barnumber);
  set_property (context (), "internalBarNumber", barnumber);

  SCM timeSignatureFraction = get_property (timing, "timeSignatureFraction");

  if (!scm_is_pair (timeSignatureFraction))
    {
      programming_error ("missing timeSignatureFraction");
      timeSignatureFraction = scm_cons (to_scm (4), to_scm (4));
    }
  set_property (context (), "timeSignatureFraction", timeSignatureFraction);

  SCM measureLength = get_property (timing, "measureLength");

  if (!unsmob<Moment> (measureLength))
    {
      measureLength
        = Moment (from_scm<Rational>
                  (scm_divide (scm_car (timeSignatureFraction),
                               scm_cdr (timeSignatureFraction)))).smobbed_copy ();
    }
  set_property (context (), "measureLength", measureLength);
  set_property (context (), "measurePosition", now_mom ().smobbed_copy ());

  SCM timeSignatureSettings = get_property (timing, "timeSignatureSettings");
  if (!scm_is_pair (timeSignatureSettings))
    {
      programming_error ("missing timeSignatureSettings");
      timeSignatureSettings = Lily::default_time_signature_settings;
    }
  set_property (context (), "timeSignatureSettings", timeSignatureSettings);

  SCM beamExceptions = get_property (timing, "beamExceptions");
  if (!scm_is_pair (beamExceptions))
    {
      beamExceptions = Lily::beam_exceptions (timeSignatureFraction,
                                              timeSignatureSettings);
    }
  set_property (context (), "beamExceptions", beamExceptions);

  SCM baseMoment = get_property (timing, "baseMoment");
  if (!unsmob<Moment> (baseMoment))
    {
      baseMoment
        = Moment (from_scm<Rational>
                  (Lily::base_length (timeSignatureFraction,
                                      timeSignatureSettings))).smobbed_copy ();
    }
  set_property (context (), "baseMoment", baseMoment);

  SCM beatStructure = get_property (timing, "beatStructure");
  if (!scm_is_pair (beatStructure))
    {
      beatStructure
        = Lily::beat_structure (to_scm (unsmob<Moment> (baseMoment)->main_part_),
                                timeSignatureFraction,
                                timeSignatureSettings);
    }
  set_property (context (), "beatStructure", beatStructure);

  set_property (context (), "beamHalfMeasure",
                            get_property (timing, "beamHalfMeasure"));

  set_property (context (), "autoBeaming",
                            get_property (timing, "autoBeaming"));
}

Rational
Timing_translator::measure_length () const
{
  SCM l = get_property (this, "measureLength");
  if (unsmob<Moment> (l))
    return unsmob<Moment> (l)->main_part_;
  else
    return Rational (1);
}

Timing_translator::Timing_translator (Context *c)
  : Translator (c)
{
}

void
Timing_translator::start_translation_timestep ()
{
  Global_context *global = find_global_context ();

  Moment now = global->now_mom ();
  Moment dt = now - global->previous_moment ();
  if (dt < Moment (0))
    {
      programming_error ("moving backwards in time");
      dt = 0;
    }
  else if (dt.main_part_.is_infinity ())
    {
      programming_error ("moving infinitely to future");
      dt = 0;
    }

  if (!dt.to_bool ())
    return;

  Moment measposp;

  SCM s = get_property (this, "measurePosition");
  if (unsmob<Moment> (s))
    measposp = *unsmob<Moment> (s);
  else
    {
      measposp = now;
    }

  int current_barnumber = from_scm (get_property (this, "currentBarNumber"), 0);
  int internal_barnumber = from_scm (get_property (this, "internalBarNumber"), 0);

  SCM cad = get_property (this, "timing");
  bool c = from_scm<bool> (cad);

  if (c)
    {
      Rational len = measure_length ();

      measposp += dt;

      while (measposp.main_part_ >= len)
        {
          measposp.main_part_ -= len;
          current_barnumber++;
          internal_barnumber++;
        }
    }

  // Because "timing" can be switched on and off asynchronously with
  // graces, measurePosition might get into strange settings of
  // grace_part_.  It does not actually make sense to have it diverge
  // from the main timing.  Updating the grace part outside of the
  // actual check for "timing" looks strange and will lead to changes
  // of grace_part_ even when timing is off.  However, when timing is
  // switched back on again, this will generally happen in an override
  // that does _not_ in itself advance current_moment.  So the whole
  // timing advance logic will only get triggered while "timing" is
  // still of.  Maybe we should keep measurePosition.grace_part_
  // constantly at zero anyway?

  measposp.grace_part_ = now.grace_part_;

  set_property (context (), "currentBarNumber", to_scm (current_barnumber));
  set_property (context (), "internalBarNumber", to_scm (internal_barnumber));
  set_property (context (), "measurePosition", measposp.smobbed_copy ());
}

#include "translator.icc"

void
Timing_translator::boot ()
{

}

ADD_TRANSLATOR (Timing_translator,
                /* doc */
                "This engraver adds the alias @code{Timing} to its containing"
                " context.  Responsible for synchronizing timing information"
                " from staves.  Normally in @code{Score}.  In order to create"
                " polyrhythmic music, this engraver should be removed from"
                " @code{Score} and placed in @code{Staff}.",

                /* create */
                "",

                /* read */
                "baseMoment "
                "currentBarNumber "
                "internalBarNumber "
                "measureLength "
                "measurePosition "
                "timeSignatureFraction ",

                /* write */
                "baseMoment "
                "currentBarNumber "
                "internalBarNumber "
                "measureLength "
                "measurePosition "
                "timeSignatureFraction "
               );
