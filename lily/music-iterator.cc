/*
  music-iterator.cc -- implement {Music,Chord,Voice}_iterator

  source file of the GNU LilyPond music typesetter

  (c) 1997 Han-Wen Nienhuys <hanwen@stack.nl>
*/

#include "music-list.hh"
#include "music-iterator.hh"
#include "translator.hh"
#include "request.hh"
#include "debug.hh"


IMPLEMENT_IS_TYPE_B(Music_iterator);

Chord_iterator::~Chord_iterator()
{
}

void
Music_iterator::do_print()const
{

}

void
Music_iterator::print() const
{
#ifndef NPRINT
  if ( !check_debug)
	return ;
  DOUT << name() << "{";
  DOUT << "report to " << 
	report_to_l() << " (" << report_to_l ()->name () << ")\n";
  DOUT << "next at " << next_moment() << " ";
  do_print();
  DOUT << "}\n";
#endif
}

Translator *
Music_iterator::get_req_translator_l()
{
  assert (report_to_l());
  if (report_to_l()->is_bottom_engraver_b ())
	return report_to_l();

  set_translator (report_to_l()->get_default_interpreter ());
  return report_to_l();
}

void
Music_iterator::push_translator (Translator*t)
{
  report_to_l_arr_.push (t);
  t->iterator_count_ ++;
}

void
Music_iterator::pop_translator()
{
  report_to_l()->iterator_count_ --;
  assert (report_to_l()->iterator_count_ >=0);
  report_to_l_arr_.pop();
}

Translator* 
Music_iterator::report_to_l()const
{
  if (! report_to_l_arr_.size())
	return 0;
  return report_to_l_arr_.top();
}


void
Music_iterator::set_translator (Translator*trans)
{   
  if (report_to_l()==trans)
	return;
  if ( report_to_l())
	pop_translator();
  if (trans)
	push_translator (trans);
}

void
Music_iterator::construct_children()
{

}

Music_iterator::~Music_iterator()
{
  set_translator (0);
}

Moment
Music_iterator::next_moment()const
{
  return 0;
}

void
Music_iterator::process_and_next (Moment)
{
  first_b_ = false;
}

bool
Music_iterator::ok()const
{
  return first_b_;
}

Music_iterator*
Music_iterator::static_get_iterator_p (Music *m,
				      Translator *report_l)
{
  Music_iterator * p =0;
  if (m->is_type_b (Request_chord::static_name()))
	p = new Request_chord_iterator ((Request_chord*) m);
  else if (m->is_type_b (Chord::static_name())) 
	p =  new Chord_iterator ((Chord*) m);
  else if (m->is_type_b (Voice::static_name())) 
	p =  new Voice_iterator ((Voice*) m);
  
  if (m -> type_str_ != "") 
    {
	Translator * a =report_l->
	    find_get_translator_l (m-> type_str_, m->id_str_);
	    p->set_translator (a);
    }


  if (! p->report_to_l())
	 p ->set_translator (report_l);
  
  return p;
}

Music_iterator*
Music_iterator::get_iterator_p (Music*m)const
{
  Music_iterator*p = static_get_iterator_p (m,report_to_l());
  p->daddy_iter_l_ = (Music_iterator*)this;
  p->construct_children();
  return p;
}

Music_iterator::Music_iterator()
{
  daddy_iter_l_ =0;
  first_b_ = true;
}

/* ************** */

Chord_iterator::Chord_iterator (Chord const *chord_C)
{
  chord_C_ = chord_C;
}

void
Chord_iterator::construct_children()
{
  int j = 0;
  for (PCursor<Music*> i (chord_C_->music_p_list_.top());  //, int j = 0; 
  	i.ok(); j++, i++) 
  	  {
	Music_iterator * mi =  get_iterator_p (i.ptr());
	if ( mi->ok()) 
	  {
	    set_translator (mi->report_to_l()->ancestor_l (
		chord_C_->multi_level_i_) );
	    children_p_list_.bottom().add (mi);
	  }
	else 
	    delete mi;
    }
}
void
Chord_iterator::do_print() const
{
#ifndef NPRINT
  for (PCursor<Music_iterator*> i (children_p_list_.top()); i.ok (); i++) 
    {
	i->print();
    }
#endif
}

void
Chord_iterator::process_and_next (Moment until)
{
  for (PCursor<Music_iterator*> i (children_p_list_.top()); i.ok ();) 
    {
	if  (i->next_moment() == until) 
	  {
	    i->process_and_next (until);
	  }
	if (!i->ok()) 
	    delete i.remove_p();
	else
	    i++;
    }
  Music_iterator::process_and_next (until);
}


IMPLEMENT_IS_TYPE_B1(Chord_iterator,Music_iterator);

Moment
Chord_iterator::next_moment()const
{
  Moment next_ = infinity_mom;
  for (PCursor<Music_iterator*> i (children_p_list_.top()); i.ok (); i++)
	next_ = next_ <? i->next_moment() ;
  return next_;
}



bool
Chord_iterator::ok()const
{
  return children_p_list_.size();
}

/* ************** */

void
Voice_iterator::do_print()const
{
  if (iter_p_)
	iter_p_->print();
}

Voice_iterator::Voice_iterator (Voice const*v)
  : PCursor<Music*> ( v->music_p_list_)
{
  here_mom_ = v->offset_mom_;
  voice_C_ = v;
  iter_p_ =0;
}

void
Voice_iterator::construct_children()
{
  while (PCursor<Music*>::ok()) 
    {
	start_next_element();
	if ( !iter_p_->ok()) 
	  {
	    leave_element();
	  }
	else 
	  {
	    set_voice_translator();
	    break;
	  }
    }
}

void 
Voice_iterator::leave_element()
{
  delete iter_p_;
  iter_p_ =0;
  MInterval elt_time = ptr()->time_int ();
  if (!elt_time.empty_b())
	here_mom_ += elt_time.length();
  PCursor<Music*>::next();
}

void
Voice_iterator::start_next_element()
{
  assert (!iter_p_);
  iter_p_ = get_iterator_p (ptr());
}

void
Voice_iterator::set_voice_translator()
{
  if (iter_p_->report_to_l()->depth_i () > report_to_l ()->depth_i ())
	set_translator (iter_p_->report_to_l());
}

Voice_iterator::~Voice_iterator()
{
  assert (! iter_p_);
}


IMPLEMENT_IS_TYPE_B1(Voice_iterator,Music_iterator);

void
Voice_iterator::process_and_next (Moment until)
{
  while (1) 
    {
	Moment local_until = until - here_mom_;
	while ( iter_p_->ok()) 
	  {
	    Moment here = iter_p_->next_moment();
	    if (here != local_until)
		goto loopexit;
	    
	    iter_p_->process_and_next (local_until);
	  }

	if (!iter_p_->ok()) 
	  {
	    leave_element();
	    if ( PCursor<Music*>::ok()) 
	      {
		start_next_element();
		set_voice_translator();
	      }
	    else 
	      {
		goto loopexit;
	      }
	  }
    }

loopexit:

  Music_iterator::process_and_next (until);
}

Moment
Voice_iterator::next_moment()const
{
  return iter_p_->next_moment() + here_mom_;
}

bool
Voice_iterator::ok()const
{
  return iter_p_;
}


IMPLEMENT_IS_TYPE_B1(Request_chord_iterator,Music_iterator);

void
Request_chord_iterator::construct_children()
{
  get_req_translator_l();
}

Request_chord_iterator::Request_chord_iterator (Request_chord*el_l)
{
  elt_l_ = el_l;
  elt_duration_ = el_l->time_int().length (); 
  last_b_ = false;
}


bool
Request_chord_iterator::ok()const
{
  return (elt_duration_ && !last_b_) || first_b_; 
}



Moment
Request_chord_iterator::next_moment()const
{
  Moment m (0);
  if  (!first_b_) 
	m = elt_duration_;
  return m;
}

void
Request_chord_iterator::do_print() const
{
#ifndef NPRINT
  DOUT << "duration: " << elt_duration_;
#endif
}
void
Request_chord_iterator::process_and_next (Moment mom)
{
  if ( first_b_) 
    {
	for (PCursor<Music*> i (elt_l_->music_p_list_); i.ok(); i++) 
	  {
	    assert (i->is_type_b (Request::static_name()));
	    Request * req_l = (Request*)i.ptr();
	    bool gotcha = report_to_l()->try_request (req_l);
	    if (!gotcha)
		req_l->warning ("Junking request: " + String (req_l->name()));

	  }
	first_b_ = false;
    }

  if ( mom >= elt_duration_)
	last_b_ = true;  
}
