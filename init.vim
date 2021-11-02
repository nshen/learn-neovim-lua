" 基础设置
lua require('basic')
lua require('plugins')
lua require('keybindings')
lua require('which-key-config')

" theme
" https://github.com/ellisonleao/gruvbox.nvim
set background=dark " or light if you want light mode
colorscheme gruvbox

" plugins confg
"-----------------
lua require('nvim-treesitter-config')
lua require('telescope-config')
lua require('nvim-autopairs-config')
lua require('nvim-tree-config')
lua require('bufferline-config')
lua require('surround-config')
lua require('comment-config')

" lsp
"lua require('nvim-lspconfig-config')
lua require('nvim-cmp-config')
