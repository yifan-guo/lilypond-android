/*   
  multi-measure-rest.cc --  implement Multi_measure_rest
  
  source file of the GNU LilyPond music typesetter
  
  (c) 1998--1999, 1999 Jan Nieuwenhuizen <janneke@gnu.org>
  
 */

#include "multi-measure-rest.hh"
#include "debug.hh"
#include "paper-def.hh"
#include "p-col.hh" // urg
#include "bar.hh"
#include "lookup.hh"
#include "rest.hh"
#include "script.hh"
#include "text-def.hh"
#include "molecule.hh"
#include "misc.hh"


Multi_measure_rest::Multi_measure_rest ()
{
  measures_i_ = 0;
}

void
Multi_measure_rest::do_print () const
{
  DOUT << "measures_i_ " << measures_i_;
}

Molecule*
Multi_measure_rest::do_brew_molecule_p () const
{
  /*
   [TODO]                                          17
     * variable-sized multi-measure rest symbol: |====| ??
     * build 3, 5, 6, 7, 8 symbols (how far, property?)
       from whole, brevis and longa rests
   */
  Molecule* mol_p = new Molecule;
  if (!column_arr_.size ())
    return mol_p;

  Molecule s;
  if (measures_i_ == 1 || measures_i_ == 2 || measures_i_ == 4) 
    {
      s = (lookup_l ()->rest (- intlog2(measures_i_), 0));
      s.translate_axis (-s.extent ()[X_AXIS].length () / 2, X_AXIS);
    }
  else 
    {
      s = (lookup_l ()->rest (-4, 0));
    }
  mol_p->add_molecule (s);
  Real interline_f = staff_line_leading_f ();
  if (measures_i_ == 1)
    {
      mol_p->translate_axis (interline_f, Y_AXIS);
    }

  if (measures_i_ > 1)
    {
      Text_def text;
      text.text_str_ = to_str (measures_i_);
      text.style_str_ = "number";
      text.align_dir_ = CENTER;
      Molecule s = text.get_molecule (paper_l (), UP);
      s.translate_axis (3.0 * interline_f, Y_AXIS);
      mol_p->add_molecule (s);
    }

  return mol_p;
}

void
Multi_measure_rest::do_add_processing ()
{
  if (column_arr_.size ())
    {
      set_bounds (LEFT, column_arr_[0 >? column_arr_.size () - 2]);
      set_bounds (RIGHT, column_arr_[column_arr_.size () - 1]);
    }
}
  
void
Multi_measure_rest::do_post_processing ()
{
  if (column_arr_.size ())
    translate_axis (extent (X_AXIS).length () / 2, X_AXIS);
}

void
Multi_measure_rest::do_substitute_element_pointer (Score_element* o, Score_element* n)
{
  Staff_symbol_referencer::do_substitute_element_pointer (o,n);
  if (Item* c = dynamic_cast <Item*> (o))
    column_arr_.substitute (c, dynamic_cast<Item*> (n));
}
  
void
Multi_measure_rest::add_column (Item* c)
{
  column_arr_.push (c);
  add_dependency (c);
}


Array<Rod>
Multi_measure_rest::get_rods () const
{
  Array<Rod> a;
  Rod r;
  r.item_l_drul_ = spanned_drul_;
  r.distance_f_ = paper_l ()->get_var ("mmrest_x_minimum");
  a.push (r);
  return a;
}
