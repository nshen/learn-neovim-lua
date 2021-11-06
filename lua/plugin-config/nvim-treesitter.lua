require'nvim-treesitter.configs'.setup {
  ensure_installed = {"html", "javascript", "lua", "typescript"}, 
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
