****************
 django.vim
****************
:VERSION: 0.1.0

A simple compiler for executing Django Unittest on VIM. Useful to use with vim-makegreen_

See http://blog.staz.be/?post/2010/09/04/Python-unit-test-and-vim for find how to use it with vim-makegreen_

.. _vim-makegreen: https://github.com/reinh/vim-makegreen

how to install
============================
use vundle_ or pathogen_ is recommended or simply extract to your vim directory

.. _vundle: https://github.com/gmarik/vundle
.. _pathogen: http://www.vim.org/scripts/script.php?script_id=2332

It is strongly recommended to use vim-localrc_ to configure. Create ``.local.vimrc`` in your
top level of django project directory as::

    " Use django unittest compiler
    compiler django

    " Optional
    " Run unittest with the current editing app
    nmap <Leader>t :call DjangoMakeGreen("%")
    " Run unittest with whole project
    nmap <Leader>T :call DjangoMakeGreen(".")

.. _vim-localrc: https://github.com/thinca/vim-localrc

how to use with vim-makegreen
==========================================================
Replace your keymap with::

    " Run unittest with the current editing app
    nmap <Leader>t :call DjangoMakeGreen("%")
    " Run unittest with whole project
    nmap <Leader>T :call DjangoMakeGreen(".")
