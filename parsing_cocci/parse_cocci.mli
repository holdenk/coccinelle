(*
 * Copyright 2012, INRIA
 * Julia Lawall, Gilles Muller
 * Copyright 2010-2011, INRIA, University of Copenhagen
 * Julia Lawall, Rene Rydhof Hansen, Gilles Muller, Nicolas Palix
 * Copyright 2005-2009, Ecole des Mines de Nantes, University of Copenhagen
 * Yoann Padioleau, Julia Lawall, Rene Rydhof Hansen, Henrik Stuart, Gilles Muller, Nicolas Palix
 * This file is part of Coccinelle.
 *
 * Coccinelle is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, according to version 2 of the License.
 *
 * Coccinelle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Coccinelle.  If not, see <http://www.gnu.org/licenses/>.
 *
 * The authors reserve the right to distribute this or future versions of
 * Coccinelle under other licenses.
 *)


# 0 "./parse_cocci.mli"
exception Bad_virt of string

val process :
    string (* filename *) -> string option (* iso filename *) ->
      bool (* verbose? *) ->
	(Ast_cocci.metavar list list) * (Ast_cocci.rule list) *
	  Ast_cocci.meta_name list list list (*fvs of the rule*) *
	  Ast_cocci.meta_name list list list (*negated pos vars*) *
	  (Ast_cocci.meta_name list list list (*used after list*) *
	     (*fresh used after list*)
	     Ast_cocci.meta_name list list list *
	     (*fresh used after list seeds*)
	     Ast_cocci.meta_name list list list) *
	  Ast_cocci.meta_name list list list (*positions list*) *
	  (string list option (*non metavars in - code, for grep*) *
	     string list option (*non metavars in - code, for glimpse/google*) *
	     (*non metavars in - code, for other tools*)
	     Get_constants2.combine option)
