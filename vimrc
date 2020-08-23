nnoremap <C-n> :bnext<cr>
inoremap <C-n> <Esc><Esc>:bnext<cr>
nnoremap <C-p> :bprev<cr>
inoremap <C-p> <Esc><Esc>:bprev<cr>

"let g:airline_extensions = [] 
"let g:airline_highlighting_cache = 1 
"let g:airline#extensions#tagbar#enabled = 0

execute pathogen#infect()
syntax on

filetype plugin indent on
au FileType yaml setl shiftwidth=2 tabstop=2 expandtab
au FileType python setl shiftwidth=4 tabstop=4 expandtab
set hidden    " allow switching buffers without saving
set nowrap


" needed to get colors & fonts working " (install powerline fonts locally!) 
set lazyredraw 
set t_Co=256

" colarized theme
let g:solarized_termcolors=256
colorscheme solarized
set background=dark


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" enable powerline fonts
"let g:airline_powerline_fonts = 1


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme='luna'
"let g:airline_solarized_bg='dark'

