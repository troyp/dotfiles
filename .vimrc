"=======
" VIMRC.
"=======

"----------
" Pathogen.
"----------
execute pathogen#infect('bundle/{}')
Helptags

" ----------
"  Vim-plug.
" ----------
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-run-interactive'
Plug 'easymotion/vim-easymotion'
Plug 'Jagua/vim-mozrepl'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'
Plug 'haya14busa/vim-migemo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Konfekt/FastFold'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neobundle'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/YankRing'
Plug 'zah/nim.vim'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" PlugUpdate

" ----------
" NeoBundle.
" ----------
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundle 'haya14busa/vim-migemo'
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"------------------------------------------------------
" -----
" Dein.
" -----
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.vim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')

" fzf
" ./install --all so the interactive script doesn't block
" you can check the other command line options  in the install file
" " not working?
" call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
" call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

" and a lot more plugins.....

call dein#end()

"------------------------------------------------------

"----------------
" Basic Settings.
"----------------

set nocompatible             " enable vim improvements
filetype plugin on           " enable extensions
set hidden                   " hide buffers instead of unloading

set shell=/bin/bash
set clipboard=unnamed

" .GVIMRC: nnoremap <C-z> :"suspending disabled <CR>

set ignorecase
set smartcase                " Smart-case search - override with \c or \C
set encoding=utf-8
set cf                       " Enable error files & error jumping.
set clipboard+=unnamed       " Yanks go on clipboard instead.
set history=256              " Number of things to remember in history.
set autowrite                " Writes on make/shell commands
set timeoutlen=250           " delay after ESC (default too long)
set nojoinspaces             " no extra space joining to lines ending in [.?!]
set virtualedit=all          " Virtual editing in all modes (place cursor past line end)
set backupdir=~/.vim/backup  " Backups in separate directory
set scrolloff=8

set nobackup
set noswapfile

autocmd BufNewFile,BufRead *.pentadactyl set filetype=vim
autocmd BufNewFile,BufRead .pentadactylrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperator set filetype=vim
autocmd BufNewFile,BufRead .vimperatorrc set filetype=vim

set rtp+=~/.fzf              " add fzf to runtimepath

set wildchar=<Tab> wildmenu wildmode=full

if has("gui_running")
    set guifont="Deja Vu Sans Mono 10"
endif

"------------------------------------------------------

function! ToggleOpt(opt)
    exec 'set' a:opt '!'
    exec 'set' a:opt '?'
endfunction

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

set autoindent
filetype plugin indent on    " filetype detection & indentation settings

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

" Tabs
tab sball
set switchbuf=usetab,newtab

"------------------------------------------------------

"-------
" Mouse.
"-------

set mouse=a                  " mouse support for all modes

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

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
" " Open on startup if no files chosen
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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

autocmd VimEnter * xmap s  <Plug>VSurround
autocmd VimEnter * xmap gs <Plug>VgSurround


"------------------------------------------------------

" ----------
" Mapleader.
"-----------

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
set timeoutlen=2000   " increase time limit to 2s
let mapleader = " "
let g:mapleader = " "
 map <Leader><Space> <Plug>(easymotion-prefix)

"------------------------------------------------------

" ------------
" NeoComplete.
" ------------
let g:neocomplete#enable_at_startup = 1

"------------------------------------------------------

" ------------
" Keybindings.
"-------------

inoremap <C-l> <Del>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-e> <End>
inoremap <C-.> <C-n>
inoremap <C-,> <C-p>
noremap <C-e> $
noremap <C-n> <C-n>
noremap <C-p> <C-p>
noremap <C-k> d$
noremap <A-;> ,
inoremap <C-A-y> <C-e>
" C-y and C-S-Y bindings override each other...?
" inoremap <C-S-Y> <C-e>
inoremap <C-y> <C-y>

" Fix Y
noremap Y y$

inoremap <A-w> <C-c>

" Move Text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Files
nnoremap <C-x><C-f> :e<space>
nnoremap <C-x><C-s> :w<cr>
inoremap <C-x><C-s> <Esc>:w<cr>i
nnoremap <C-x><C-w> :w<cr>
inoremap <C-x><C-w> <Esc>:w<cr>i
nnoremap <leader>w :w!<cr>
nnoremap <leader>ff :edit<space>

" External Programs
noremap <f12> :!usr/bin/dolphin<CR>
noremap <S-f4> :!roxterm expand('%:p:h')

" Eval
noremap <C-x><C-e> :echom<space>

" Fast editing of the .vimrc
noremap <leader>fed :e! ~/.vimrc<cr>
noremap <leader>feR :so ~/.vimrc<cr>
noremap <leader>feS :Verbose :scriptnames<cr>
noremap <leader>f<C-e>d :e! ~/.gvimrc<cr>
noremap <leader>f<C-e>R :so ~/.gvimrc<cr>

noremap <leader>ev :e! ~/.vimrc<cr>
noremap <leader>eg :e! ~/.gvimrc<cr>
noremap <leader>sv :so ~/.vimrc<cr>
noremap <leader>sg :so ~/.gvimrc<cr>

" Readonly mode
noremap <leader>bw :call ToggleOpt('readonly')<cr>

" Windows
noremap <C-x>0 :hide<cr>
noremap <S-Del> :hide<cr>
noremap <C-Del> :close!<cr>
noremap <C-x>1 :only<cr>
noremap <C-x>2 :split<cr>
noremap <C-x>3 :vsplit<cr>
noremap <C-tab> <C-w>w

" Tabs
noremap <A-[> gT
noremap <A-]> gt
noremap <A-1> :tabn 1<cr>
noremap <A-2> :tabn 2<cr>
noremap <A-3> :tabn 3<cr>
noremap <A-4> :tabn 4<cr>
noremap <A-5> :tabn 5<cr>
noremap <A-6> :tabn 6<cr>

" Buffers
noremap <Leader>bb :ls<CR>:b<Space>
noremap <Leader><tab> :bNext<cr>
" :bprevious is doing the same as :bNext??
"nnoremap <Leader><S-Tab> :bprevious<cr>

" Close buffer but not window
noremap <C-x>k :bp<bar>sp<bar>bn<bar>bd<space>
noremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <Del> :bp<bar>sp<bar>bn<bar>bd<CR>

" Quit
noremap <leader>xx :q<cr>
noremap Q :qa<cr>

" Replace Q by <leader>:
noremap <leader>: Q

" F2 = Move rest of line to new line
noremap <C-j> i<CR><ESC>

" Line Numbers
noremap <leader>tn :set invnumber<cr>
" Line wrap"
noremap <leader>t<C-l> :set wrap! wrap?<cr>

" Undo
" note: <C-/> is read as /
noremap <C-_> :normal u<cr>

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

" ------
" Regex.
" ------

" http://vim.wikia.com/wiki/Folding_with_Regular_Expression
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

" -------------
" Text Objects.
" -------------
" line text object
vnoremap il <esc>g_v_
vnoremap al <esc>$v0
onoremap il :<c-u>normal! g_v_<cr>
onoremap al :<c-u>normal! $v0<cr>


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
command! RevertBuffer edit!
command! AutoRevertBuffer set autoread
command! NoAutoRevertBuffer set noautoread
command! ShowIndentOptions verbose set ai? cin? cink? cino? si? inde? indk?
" map query commands
command! Nshow verbose nmap
command! Vshow verbose vmap
command! Ishow verbose imap
command! Wrap set wrap!


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

" =========
" Vimpager.
" =========
" allows use of vimpager from vim with :Page command or <leader>v binding
set rtp^=/opt/vimpager

"------------------------------------------------------

" -----------
" Ocaml/OPAM.
" -----------
" merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
command! Opamupdatedocs :execute "helptags " . substitute(system('opam config var share'),'\n$','','''') .  "/merlin/vim/doc"
" ocp-indent
set rtp^="/home/troy/.opam/system/share/ocp-indent/vim"

"------------------------------------------------------

" --------
" Less.sh.
" --------
function! BindQuit()
    map q :quit<cr>
endfunction
function! LessInitFunc()
    map <f12> :call BindQuit()<cr>
endfunction

" -----------------------------------------------------

" -------
" nim.vim
" -------
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
