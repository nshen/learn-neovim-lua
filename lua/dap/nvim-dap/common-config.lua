local status, dap = pcall(require, "dap")
if not status then
  return
end

local dap_status, dapui = pcall(require, "dapui")
if not dap_status then
  return
end

local M = {}

M.keyAttach = function()
  -- run
  keymap("n", "<leader>dc", dap.continue())
  -- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

  --  stepOver, stepInto, stepOut,
  keymap("n", "<leader>dj", dap.step_over())
  keymap("n", "<leader>di", dap.step_into())
  keymap("n", "<leader>do", dap.step_out())

  -- 设置断点
  keymap("n", "<leader>dt", dap.toggle_breakpoint())
  -- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  -- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  keymap("n", "<leader>dT", dap.clear_breakpoints())

  -- 弹窗
  keymap("n", "<leader>dh", dapui.eval())
  -- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>

  -- 结束

  keymap("n", "<leader>de", dap.terminate())
  -- keymap(
  --   "n",
  --   "<leader>de",
  --   ":lua require'dap'.close()<CR>"
  --     .. ":lua require'dap'.terminate()<CR>"
  --     .. ":lua require'dap.repl'.close()<CR>"
  --     .. ":lua require'dapui'.close()<CR>"
  --     .. ":lua require('dap').clear_breakpoints()<CR>"
  --     .. "<C-w>o<CR>"
  -- )

  -- rust
  -- map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
end

return M
