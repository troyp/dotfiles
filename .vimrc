"=======
" VIMRC.
"=======

"----------
" Pathogen.
"----------
execute pathogen#infect()
Helptags

" ----------
"  Vim-plug.
" ----------
call plug#begin('~/.vim/plugged')

call plug#end()

"------------------------------------------------------

"----------------
" Basic Settings.
"----------------

set nocompatible             " enable vim improvements
filetype plugin on           " enable extensions
filetype plugin indent on    " filetype detection & indentation settings
set hidden                   " hide buffers instead of unloading

set shell=/bin/bash
set clipboard=unnamed

" .GVIMRC: nnoremap <C-z> :"suspending disabled <CR>

set smartcase                " Smart-case search - override with \c or \C
set encoding=utf-8
set cf                       " Enable error files & error jumping.
set clipboard+=unnamed       " Yanks go on clipboard instead.
set history=256              " Number of things to remember in history.
set autowrite                " Writes on make/shell commands
set timeoutlen=250           " delay after ESC (default too long)
set nojoinspaces             " no extra space joining to lines ending in [.?!]
set virtualedit=all

autocmd BufNewFile,BufRead *.pentadactyl set filetype=vim
autocmd BufNewFile,BufRead .pentadactylrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperator set filetype=vim
autocmd BufNewFile,BufRead .vimperatorrc set filetype=vim

set rtp+=~/.fzf              " add fzf to runtimepath

set wildchar=<Tab> wildmenu wildmode=full

"------------------------------------------------------

"------------
" Formatting.
"------------

set nowrap                   " Line wrapping off

set ts=4                     " Tabs are 4 spaces
set bs=2                     " Backspace over everything in insert mode
set shiftwidth=4             " Tabs under smart indent

set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

"------------------------------------------------------

"-----
" GUI.
"-----

syntax on                    " syntax highlighting
set background=dark          " use colours that suit a dark background
colorscheme evening         
"others: evening, jellybeans, twilight, desert, bubblegum, vividchalk, zenburn
set laststatus=2             " always display status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set ruler                    " Ruler on
set showcmd                  " show (partial) commands in last line
set number                   " Line numbers on

set incsearch                " show incsearch matches (leave showing: hls/nohls)

set showmatch                " Show matching brackets.
set mat=5                    " Bracket blinking = 0.5s

" Set display for invisible characters (only show when :set list)
set listchars=tab:\|_,eol:¶,nbsp:%,trail:~,extends:>,precedes:<
set nolist                   " don't show invisible characters

set novisualbell             " No blinking.
set noerrorbells             " No noise.

map <C-tab> <C-w>w

"------------------------------------------------------

"-------
" Mouse.
"-------

set mouse=a                  " mouse support for all modes
set ttymouse=xterm2            " set terminal mouse support codes

"------------------------------------------------------

" --------
" Airline.
"---------

let g:Powerline_symbols = 'fancy'

let g:airline_powerline_fonts = 1    "for airline
"let g:airline_theme='bubblegum'
"let g:airline_theme='dark'

"------------------------------------------------------

" ---------
" NerdTree.
" ---------

" Don't open on startup
let g:nerdtree_tabs_open_on_gui_startup=0
" Open on startup if no files chosen
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close Vim if only NerdTree remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle
map <C-n> :NERDTreeToggle<CR>

"------------------------------------------------------

" ------
" CtrlP.
"-------

set runtimepath^=~/.vim/bundle/ctrlp.vim


"------------------------------------------------------

" ---------
" Surround.
"----------



"------------------------------------------------------

" ----------
" Mapleader.
"-----------

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
set timeoutlen=2000   " increase time limit to 2s
let mapleader = " "
let g:mapleader = " "

"------------------------------------------------------

" ------------
" NeoComplete.
" ------------
let g:neocomplete#enable_at_startup = 1

"------------------------------------------------------

" ------------
" Keybindings.
"-------------

noremap <C-e> $
nnoremap <C-S-Y> <C-e>

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast editing of the .vimrc
noremap <leader>ev :e! ~/.vimrc<cr>
noremap <leader>eg :e! ~/.gvimrc<cr>
noremap <leader>sv :so ~/.vimrc<cr>
noremap <leader>sg :so ~/.gvimrc<cr>

" Windows
noremap <leader>x0 :hide<cr>
noremap <leader>x1 :only<cr>
noremap <leader>x2 :split<cr>
noremap <leader>x3 :vsplit<cr>

" Close buffer but not window
noremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" F2 = Move rest of line to new line
noremap <C-j> i<CR><ESC>

" -----------
" Smart Home.
" -----------
"
" http://vim.wikia.com/wiki/Smart_home
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
"
noremap <expr> <silent> <C-a> SmartHome()
imap <silent> <C-a> <C-O><Home>

"------------------------------------------------------
"
" --------
" Aliases.
" --------

" Set selection to write to clipboard
command! Clipon set clipboard=unnamed
command! Clipoff set clipboard=
" Close buffer (without closing window)
command! Bc bnext | bdelete #
" Sudo write
command! W w !sudo tee % > /dev/null
command! XC quit | quit | quit | quit


"------------------------------------------------------

" ---------
" DiffOrig.
"----------

"view changes in buffer
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
               \ | wincmd p | diffthis
endif

"------------------------------------------------------

