" Windows _vimrc file
" David Verdi
" Created on 5/29/2016
" Updated on 5/29/2016

" File goes here: C:\Program Files (x86)\Vim\_vimrc

""""""""""""""""
" Default Windows Vim Settings

" Use Vim settings rather than Vi setings
set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

" This sets Vim to behave like a windows editor
" (i.e. using Ctrl-x and Ctrl-v for copy/paste)
" I do not want to enable this
"behave mswin

" Vim's questionable fix to make diff work on windows. 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" End Default Windows Vim Settings
""""""""""""""""

""""""""""""""""
" General Vim settings

"Make encoding Unicode
set encoding=utf-8

" Display Line Numbers
set number

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show the cursor position at all times
set ruler	

" display incomplete commands
set showcmd		

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch buffers using Meta+Right and Meta+Left
:nnoremap <M-Right> :bnext<CR>
:nnoremap <M-Left> :bprevious<CR>

" Enable Auto-indenting
set autoindent
set smartindent

" Auto-indent four spaces
set shiftwidth=4

" Replace tab with appropriate number of spaces, except with makefiles
set expandtab
autocmd Filetype make setlocal noexpandtab

" Settings for *.txt files
"   - Indent lines automatically
"   - Replace tab with 8 spaces
"   - Move 8 spaces with tab key
"   - Wrap text at 76 columns
"   - Check Spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=8 textwidth=76 spell spelllang=en_us

" No spell checking with Vim help files
autocmd FileType help setlocal nospell

" Do incremental searching
set incsearch

"Ignore case when searching
set ignorecase

" Switch on highlighting the last used search pattern.
set hlsearch

" Auto reload files changed outside of Vim
set autoread

" Put buffers in background instead of closing them
set hidden

" Have a lot of history
set history=1000

" Use a better Regex Engine
set re=1

" Set Syntax highlighing on
syntax enable

" Set font and background color
set t_Co=256
if has('gui_running')
  set guifont=Consolas:h11:cANSI
  colorscheme desert
  "set background=dark
endif

" Turn off backups and swap files on windows
" Editing is local anyway, so no risk of disconnects
set noswapfile
set nobackup
set nowritebackup

