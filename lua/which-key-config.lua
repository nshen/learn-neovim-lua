-- https://github.com/folke/which-key.nvim

local wk = require("which-key")
local mappings = {
  q = {":q<CR>", "QUit"},
  Q = {":wq<CR>", "Save & Quit"},
  w = {":w<CR>", "Save"},
  E = {":e ~/.config/nvim/init.vim<CR>" , "Edit config"},
  f = {":Telescope find_files<CR>","Telescope Find Files"},
  r = {":Telescope live_grep<CR>","Telescope Live Grep"},
  a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action'},
  g = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>','Show line diagnostics'},
  l = {
    name = "LSP",
    i = {":LspInfo<cr>", "Connected Language Servers"},
    A = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>','Add workspace folder'},
    R = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>','Remove workspace folder'},
    l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspace'},
    D = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition'},
    r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action'},
    e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'Show line diagnostic'},
    q = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Set loclist'},
    f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format'}
  }
}
wk.register(mappings, { prefix = "<leader>" })



