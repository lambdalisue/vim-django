" Vim compiler file
" Compiler:	Unit testing tool for Django. Use this with vim-django-support
" Author:	Alisue <lambdalisue@hashnote.net>

if exists("current_compiler")
  finish
endif
let current_compiler = "django"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ \=\-]%\\@=%m,%-G%.%#
CompilerSet makeprg=django-admin.py\ test\ $*\ >\ \/dev\/null


