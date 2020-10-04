/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1997--2020 Jan Nieuwenhuizen <janneke@gnu.org>

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

#include "midi-stream.hh"

#include "file-path.hh"
#include "international.hh"
#include "main.hh"
#include "midi-chunk.hh"
#include "misc.hh"
#include "program-option.hh"
#include "string-convert.hh"
#include "warn.hh"

#include <cerrno>
#include <fcntl.h>
#include <sstream>

using std::string;


class Midi_stream_file
	: public Midi_stream
{
public:
  Midi_stream_file (const std::string &file_name_string);
  ~Midi_stream_file ();

private:
  virtual void write (const std::string &);

private:
  int out_file_;
  std::string tmp_file_name_;
  std::string dest_file_name_;
};


void on_midi_output (const std::string &filename, const std::vector<uint8_t> &data);


class Midi_stream_memory
	: public Midi_stream
{
public:
  Midi_stream_memory (const std::string &file_name)
    : file_name_(file_name)
  {
  }

  ~Midi_stream_memory ()
  {
    const std::string &s = stream_.str();

    std::vector<uint8_t> data;
    data.reserve(s.size());
    data.assign(s.begin(), s.end());

    on_midi_output(file_name_, data);
  }

private:
  virtual void write (const std::string &data)
  {
    stream_ << data;
  }

private:
  std::string file_name_;
  std::stringstream stream_;
};


typedef std::shared_ptr<Midi_stream> Midi_stream_ptr;

Midi_stream_ptr
Midi_stream::create (const std::string &file_name)
{
  if (from_scm<bool> (ly_get_option (ly_symbol2scm ("memory-output"))))
    return Midi_stream_ptr(new Midi_stream_memory(file_name));

  return Midi_stream_ptr(new Midi_stream_file(file_name));
}


Midi_stream_file::Midi_stream_file (const string &file_name)
{
  dest_file_name_ = file_name;
  int tries = 10;

  int flags = O_WRONLY | O_CREAT | O_EXCL;
  // Need to open the file in binary mode for Windows to avoid translations, but
  // flag doesn't exist for other systems.
#ifdef O_BINARY
  flags |= O_BINARY;
#endif

  while (tries--)
    {
      tmp_file_name_
        = String_convert::form_string ("%s.%8x", file_name.c_str (), rand ());
      out_file_ = ::open (tmp_file_name_.c_str (), flags, 0666);
      if (out_file_ != -1)
        return;
    }

  error (_f ("cannot create temp file: %s: %s", tmp_file_name_.c_str (),
             strerror (errno)));
}

Midi_stream_file::~Midi_stream_file ()
{
  close (out_file_);

  if (!rename_file (tmp_file_name_.c_str (), dest_file_name_.c_str ()))
    {
      error (_f ("cannot rename `%s' to `%s'", tmp_file_name_.c_str (),
                 dest_file_name_.c_str ()));
    }
}

void
Midi_stream_file::write (const string &str)
{
  size_t count = str.length ();
  size_t written = ::write (out_file_, str.data (), count);

  if (written != count)
    warning (_f ("cannot write to file: `%s': %s", tmp_file_name_.c_str ()),
             strerror (errno));
}

void
Midi_stream::write (Midi_chunk const &midi)
{
  string str = midi.to_string ();

  return write (str);
}
