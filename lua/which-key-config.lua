-- https://github.com/folke/which-key.nvim

local wk = require("which-key")
local mappings = {
  q = {":q<CR>", "QUit"},
  Q = {":wq<CR>", "Save & Quit"},
  w = {":w<CR>", "Save"},
  E = {":e ~/.config/nvim/init.vim<CR>" , "Edit config"},
  f = {":Telescope find_files<CR>","Telescope Find Files"},
  r = {":Telescope live_grep<CR>","Telescope Live Grep"}
  
}
wk.register(mappings, { prefix = "<leader>" })



