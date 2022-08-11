" ============================ Vim-Plugins ==============================

call plug#begin()
"This script contains all vim-plugins
source ~/AppData/Local/nvim/nvimSettings/plugins.vim

call plug#end()

" ==================== Neovim and Plugin Setting ========================

"This script contains general neovim settings
source ~/AppData/Local/nvim/nvimSettings/general_settings.vim

"This script contains vim-airline settings
source ~/AppData/Local/nvim/nvimSettings/vim-airline.vim

"This script contains nvim-lspconfig settings
source ~/AppData/Local/nvim/nvimSettings/nvim-lspconfig.vim

"This script contains Nerd Tree settings
source ~/AppData/Local/nvim/nvimSettings/nerdtree.vim

"This script contains vim-devicons settings
source ~/AppData/Local/nvim/nvimSettings/vim-devicons.vim

"This script contains vim-nerdtree-syntax-highlighting settings
source ~/AppData/Local/nvim/nvimSettings/vim-nerdtree-syntax-highlight.vim

"This script contains vim-commentary settings
source ~/AppData/Local/nvim/nvimSettings/vim-commentary.vim


" ==================== LSP Source ======================================

"This sources the lua script to run all remaining nested lua scripts 
lua require('init')


































