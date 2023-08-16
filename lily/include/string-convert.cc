/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1997--2020 Han-Wen Nienhuys <hanwen@xs4all.nl>,
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

#include "string-convert.hh"

#include <algorithm>
#include <cassert>
#include <cstdio>
#include <cstring>
#include <string>

using std::string;

/**
   A safe length for stringconversion buffers.

   worst case would be %f printing HUGE (or 1/HUGE), which is approx
   2e318, this number would have approx 318 zero's in its string.

   Should enlarge buff dynamically.

   @see
   man 3 snprintf
*/
static const int STRING_BUFFER_LEN = 1024;

string
String_convert::bin2hex (Byte bin_char)
{
  string str;
  str += nibble2hex_byte ((Byte) (bin_char >> 4));
  str += nibble2hex_byte (bin_char++);
  return str;
}

string
String_convert::bin2hex (const string &bin_string)
{
  string str;
  Byte const *byte = (Byte const *)bin_string.data ();
  for (ssize i = 0; i < bin_string.length (); i++)
    {
      str += nibble2hex_byte ((Byte) (*byte >> 4));
      str += nibble2hex_byte (*byte++);
    }
  return str;
}

int
String_convert::dec2int (const string &dec_string)
{
  if (!dec_string.length ())
    return 0;

  long l = 0;
  if (!sscanf (dec_string.c_str (), "%ld", &l))
    assert (false);

  return (int)l;
}

int
String_convert::hex2bin (string hex_string, string &bin_string_r)
{
  if (hex_string.length () % 2)
    hex_string = "0" + hex_string;

  bin_string_r = "";
  Byte const *byte = (Byte const *) hex_string.data ();
  ssize i = 0;
  while (i < hex_string.length ())
    {
      int high_i = hex2nibble (*byte++);
      int low_i = hex2nibble (*byte++);
      if (high_i < 0 || low_i < 0)
        return 1; // invalid char
      bin_string_r += static_cast<char> (high_i << 4 | low_i);
      i += 2;
    }
  return 0;
}

string
String_convert::hex2bin (const string &hex_string)
{
  string str;

  if (hex2bin (hex_string, str))
    assert (false);

  return str;
}

int
String_convert::hex2nibble (Byte byte)
{
  if (byte >= '0' && byte <= '9')
    return byte - '0';
  if (byte >= 'A' && byte <= 'F')
    return byte - 'A' + 10;
  if (byte >= 'a' && byte <= 'f')
    return byte - 'a' + 10;
  return -1;
}

// stupido.  Should use int_string ()
string
String_convert::unsigned2hex (unsigned u, size_t length, char fill_char)
{
  string str;
  if (!u)
    str = "0";

  while (u)
    {
      str = string (1, (char) ((u % 16)["0123456789abcdef"])) + str;
      u /= 16;
    }

  if (str.length () < length)
    str = string (length - str.length (), fill_char) + str;
  while ((str.length () > length) && (str[ 0 ] == 'f'))
    str = str.substr (2);

  return str;
}

string
String_convert::int2hex (int i, size_t length_i, char fill_char)
{
  return unsigned2hex ((unsigned)i, length_i, fill_char);
}

Byte
String_convert::nibble2hex_byte (Byte byte)
{
  if ((byte & 0x0f) <= 9)
    return (Byte) ((byte & 0x0f) + '0');
  else
    return (Byte) ((byte & 0x0f) - 10 + 'a');
}
/**
   Convert an integer to a string

   @param
   #fmt# is a printf style format, default assumes "%d" as format.
*/
string
String_convert::int_string (int i, char const *fmt)
{
  char buffer[STRING_BUFFER_LEN];
  snprintf (buffer, STRING_BUFFER_LEN,
            (fmt ? fmt : "%d"), i); // assume radix 10
  return string (buffer);
}

string
String_convert::form_string (char const *format, ...)
{
  va_list args;
  va_start (args, format);
  char buffer[STRING_BUFFER_LEN];
  vsnprintf (buffer, STRING_BUFFER_LEN, format, args);
  va_end (args);
  return string (buffer);
}

string
String_convert::vform_string (char const *format, va_list args)
{
  char buffer[STRING_BUFFER_LEN];
  vsnprintf (buffer, STRING_BUFFER_LEN, format, args);
  return string (buffer);
}

string
String_convert::pad_to (const string &s, size_t n)
{
  return s + string (std::max (int (n - s.length ()), 0), ' ');
}

string
String_convert::to_upper (string s)
{
  // Implicit copy of argument, no reference.
  std::transform(s.begin (), s.end (), s.begin (), ::toupper);
  return s;
}

string
String_convert::to_lower (string s)
{
  // Implicit copy of argument, no reference.
  std::transform(s.begin (), s.end (), s.begin (), ::tolower);
  return s;
}

string
String_convert::be_u16 (uint16_t u)
{
  char r[2];
  r[0] = uint8_t (u >> 8);
  r[1] = uint8_t (u);
  return string (r, 2);
}

string
String_convert::be_u32 (uint32_t u)
{
  char r[4];
  r[0] = uint8_t (u >> 24);
  r[1] = uint8_t (u >> 16);
  r[2] = uint8_t (u >> 8);
  r[3] = uint8_t (u);
  return string (r, 4);
}

string
String_convert::be_u24 (uint32_t u)
{
  char r[3];
  r[0] = uint8_t (u >> 16);
  r[1] = uint8_t (u >> 8);
  r[2] = uint8_t (u);
  return string (r, 3);
}
