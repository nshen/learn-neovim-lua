local M = {}

M.keyAttach = function(bufnr)
  -- run
  keymap("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
  -- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

  --  stepOver, stepInto, stepOut,
  keymap("n", "<leader>dj", ":lua require'dap'.step_over()<CR>")
  keymap("n", "<leader>dl", ":lua require'dap'.step_into()<CR>")
  keymap("n", "<leader>dk", ":lua require'dap'.step_out()<CR>")

  -- 设置断点
  keymap("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>")
  -- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  -- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  keymap("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>")

  -- 弹窗
  keymap("n", "<leader>dh", ":lua require'dapui'.eval()<CR>")
  -- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>

  -- 结束
  keymap(
    "n",
    "<leader>de",
    ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. ":lua require('dap').clear_breakpoints()<CR>"
      .. "<C-w>o<CR>"
  )

  -- rust
  -- map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
end

return M
