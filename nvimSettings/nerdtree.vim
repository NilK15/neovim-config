" Sets Nerd Tree's expand and collapse folder icons
let g:NERDTreeDirArrowExpandable="" "+
let g:NERDTreeDirArrowCollapsible="" "~

" Maps CTRL+F to open/focus onto Nerd Tree
nnoremap <C-f> :NERDTreeFocus<CR>

" Opens Nerd Tree whenever we enter nvim
" autocmd vimenter * NERDTree | wincmd p

" Exit Vim if Nerd Tree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
