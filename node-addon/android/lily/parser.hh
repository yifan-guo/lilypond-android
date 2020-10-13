/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_OUT_PARSER_HH_INCLUDED
# define YY_YY_OUT_PARSER_HH_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    END_OF_FILE = 0,
    PREC_BOT = 258,
    REPEAT = 259,
    ALTERNATIVE = 260,
    COMPOSITE = 261,
    ADDLYRICS = 262,
    UNSIGNED = 263,
    REAL = 264,
    E_UNSIGNED = 265,
    EVENT_IDENTIFIER = 266,
    EVENT_FUNCTION = 267,
    HYPHEN = 268,
    EXTENDER = 269,
    DURATION_IDENTIFIER = 270,
    NUMBER_IDENTIFIER = 271,
    PREC_TOP = 272,
    ACCEPTS = 273,
    ALIAS = 274,
    BOOK = 275,
    BOOKPART = 276,
    CHANGE = 277,
    CHORDMODE = 278,
    CHORDS = 279,
    CONSISTS = 280,
    CONTEXT = 281,
    DEFAULT = 282,
    DEFAULTCHILD = 283,
    DENIES = 284,
    DESCRIPTION = 285,
    DRUMMODE = 286,
    DRUMS = 287,
    ETC = 288,
    FIGUREMODE = 289,
    FIGURES = 290,
    HEADER = 291,
    INVALID = 292,
    LAYOUT = 293,
    LYRICMODE = 294,
    LYRICS = 295,
    LYRICSTO = 296,
    MARKUP = 297,
    MARKUPLIST = 298,
    MIDI = 299,
    NAME = 300,
    NOTEMODE = 301,
    OVERRIDE = 302,
    PAPER = 303,
    REMOVE = 304,
    REST = 305,
    REVERT = 306,
    SCORE = 307,
    SCORELINES = 308,
    SEQUENTIAL = 309,
    SET = 310,
    SIMULTANEOUS = 311,
    TEMPO = 312,
    TYPE = 313,
    UNSET = 314,
    WITH = 315,
    NEWCONTEXT = 316,
    CHORD_BASS = 317,
    CHORD_CARET = 318,
    CHORD_COLON = 319,
    CHORD_MINUS = 320,
    CHORD_SLASH = 321,
    ANGLE_OPEN = 322,
    ANGLE_CLOSE = 323,
    DOUBLE_ANGLE_OPEN = 324,
    DOUBLE_ANGLE_CLOSE = 325,
    E_BACKSLASH = 326,
    E_EXCLAMATION = 327,
    E_PLUS = 328,
    FIGURE_CLOSE = 329,
    FIGURE_OPEN = 330,
    FIGURE_SPACE = 331,
    MULTI_MEASURE_REST = 332,
    EXPECT_MARKUP = 333,
    EXPECT_SCM = 334,
    BACKUP = 335,
    REPARSE = 336,
    EXPECT_MARKUP_LIST = 337,
    EXPECT_OPTIONAL = 338,
    EXPECT_NO_MORE_ARGS = 339,
    EMBEDDED_LILY = 340,
    BOOK_IDENTIFIER = 341,
    CHORD_MODIFIER = 342,
    CHORD_REPETITION = 343,
    DRUM_PITCH = 344,
    DURATION_ARG = 345,
    FRACTION = 346,
    LOOKUP_IDENTIFIER = 347,
    LYRIC_ELEMENT = 348,
    MARKUP_FUNCTION = 349,
    MARKUP_LIST_FUNCTION = 350,
    MARKUP_IDENTIFIER = 351,
    MARKUPLIST_IDENTIFIER = 352,
    MUSIC_FUNCTION = 353,
    MUSIC_IDENTIFIER = 354,
    NOTENAME_PITCH = 355,
    PITCH_IDENTIFIER = 356,
    RESTNAME = 357,
    SCM_ARG = 358,
    SCM_FUNCTION = 359,
    SCM_IDENTIFIER = 360,
    SCM_TOKEN = 361,
    STRING = 362,
    SYMBOL_LIST = 363,
    TONICNAME_PITCH = 364,
    SYMBOL = 365,
    UNARY_MINUS = 366
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif



int yyparse (Lily_parser *parser, SCM *retval);

#endif /* !YY_YY_OUT_PARSER_HH_INCLUDED  */
