local uConfig = require("uConfig")
local uVenn = uConfig.venn

if uVenn == nil or not uVenn.enable then
  return
end

vim.keymap.set("n", uVenn.toggle, function()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "v", uVenn.draw_box, ":VBox<CR>", { noremap = true })
    print("-- venn mode --")
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    print(" ")
    print(" ")
    vim.cmd([[messages clear]])
    vim.b.venn_enabled = nil
  end
end, { noremap = true, silent = true })
