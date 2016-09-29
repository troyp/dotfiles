set lines=53 columns=81
autocmd BufEnter *.c($|pp$) set guifont=Courier\ New\ 14
set guioptions-=T
set winaltkeys=no
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TTYPE=%Y]\ [ASCII=%03.3b]\ [HEX=\%02.2B]\ [POS=$04l,%04v][%p%%]\ [LEN=%L]
colorscheme evening         

nnoremap <C-z> :"suspending disabled <CR>

