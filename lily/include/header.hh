/*
  header.hh -- declare 

  source file of the GNU LilyPond music typesetter

  (c) 1997 Han-Wen Nienhuys <hanwen@stack.nl>
*/


#ifndef HEADER_HH
#define HEADER_HH

#include "string.hh"
#include "assoc.hh"


struct Header : Assoc<String, String>
{
};

#endif // HEADER_HH
