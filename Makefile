#################################################################################
#                OCamldot                                                       #
#                                                                               #
#    Copyright (C) 2005-2012 Institut National de Recherche en Informatique et  #
#    en Automatique. All rights reserved.                                       #
#                                                                               #
#    This program is free software; you can redistribute it and/or modify       #
#    it under the terms of the GNU Lesser General Public License version        #
#    3 as published by the Free Software Foundation.                            #
#                                                                               #
#    This program is distributed in the hope that it will be useful,            #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of             #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              #
#    GNU Lesser General Public License for more details.                        #
#                                                                               #
#    You should have received a copy of the GNU Lesser Public License           #
#    along with this program; if not, write to the Free Software                #
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA                   #
#    02111-1307  USA                                                            #
#                                                                               #
#    Contact: Maxence.Guesdon@inria.fr                                          #
#################################################################################

all:
	dune build @install

test:
	dune runtest

doc:
	dune build @doc

clean:
	dune clean

.PHONY: doc test all clean

###########
# Web
###########
webdoc: doc
	mkdir -p ../ocamldot-gh-pages/refdoc
	cp ocamldoc/* ../ocamldot-gh-pages/refdoc/
	cp web/index.html web/style.css ../ocamldot-gh-pages/

###########
# headers :
###########
HEADFILES=Makefile */*.ml */*.mli */*.mly */*.mll
.PHONY: headers noheaders
headers:
	headache -h header -c ~/.headache_config $(HEADFILES)

noheaders:
	headache -r -c ~/.headache_config $(HEADFILES)
