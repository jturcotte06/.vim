" vimrc file for vim
" Justin Turcotte <justin@kturcotte.me>
" Last change: 2020 Jan 22

" EXAMPLE {{{
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
" }}}

" COLORS {{{
colorscheme badwolf
syntax enable
" }}}

" SPACES & TABS {{{
set tabstop=4 " # of spaces in a tab
set softtabstop=4 " # of spaces in a tab during editing
set expandtab " turns tabs into spaces - consistency on all machines!
" }}}

" UI CONFIG {{{
set number " show line numbers
set showcmd " shows last command entered in the bottom right of vim
set cursorline " highlights the current line
" filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for the command menu
set lazyredraw " redraw the screen only when needed
set showmatch " highlight matching [{()}]
" }}}

" SEARCHING {{{
set incsearch " searches as characrters are entered
set hlsearch " highlights search matches

" easy macro to run off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" FOLDING {{{
set foldenable " enables folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds max

" space open/closes folds
nnoremap <space> za

set foldmethod=indent " fold based on indent level
" }}}

" MOVEMENT {{{
" move vertically by visual line - don't skip wrapped lines
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]
" }}}

" LEADER SHORTCUTS {{{
" remap jk to escape
inoremap jk <esc>
" }}}

" BACKUPS {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" ORGANIZATION {{{
set modelines=2
" vim:foldmethod=marker:foldlevel=0
" }}}
