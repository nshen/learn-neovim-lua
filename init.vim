" 基础设置
lua require('basic')
" 插件列表
lua require('plugins')
" 快捷键映射
lua require('keybindings')
lua require('which-key-config')
" 皮肤设置
" https://github.com/ellisonleao/gruvbox.nvim
set background=dark " or light if you want light mode
colorscheme gruvbox
" 插件配置
lua require('nvim-treesitter-config')
lua require('telescope-config')
lua require('nvim-autopairs-config')
lua require('nvim-tree-config')
lua require('bufferline-config')
lua require('surround-config')
lua require('comment-config')

" lsp
lua require('lsp/nvim-cmp-config')
lua require('lsp/diagnostic_signs')
lua require('lsp/language_servers')

