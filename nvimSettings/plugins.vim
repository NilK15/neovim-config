"Provides colored status icons and information in Neovim
Plug 'vim-airline/vim-airline'

"Directory tree explorer inside Neovim
Plug 'preservim/nerdtree'

"Syntax highlight inside Nerd Tree based on file type
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Icons for files, i.e Nerd Tree
Plug 'ryanoasis/vim-devicons'

" Comment code (type gcc in Normal mode)
Plug 'tpope/vim-commentary'

"Display CSS color for color values
Plug 'ap/vim-css-color'



"======================== LSP Related ======================

"Native LSP wrapper for LSP configuration
Plug 'neovim/nvim-lspconfig'

"Autocomplete engine
Plug 'hrsh7th/nvim-cmp'

"Autocomplete sources to feed the autocomplete engine (nvim-cmp)
Plug 'hrsh7th/cmp-nvim-lsp' "For LSP completion
Plug 'hrsh7th/cmp-buffer'   "For text in the current buffer of Neovim
Plug 'hrsh7th/cmp-path'     "For pathing completion
Plug 'hrsh7th/cmp-cmdline'  "For command line completion

"Snippet engine to handle snippets
Plug 'L3MON4D3/LuaSnip'

"LSP Saga provides prebuilt, good looking implementations of LSP functions
"such as hoverdocs, diagnostics, etc
Plug 'glepnir/lspsaga.nvim'

"Helper for jdtls, eclipse featured language server
Plug 'mfussenegger/nvim-jdtls'


