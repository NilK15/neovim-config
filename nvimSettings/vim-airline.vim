call plug#begin()
Plug 'vim-airline/vim-airline'
call plug#end()


let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''"
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''"
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
