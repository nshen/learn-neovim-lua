local dap = require("dap")
require("telescope").load_extension("dap")

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/apps/node/out/src/nodeDebug.js" },
}

dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>dso", ':lua require"dap".step_out()<CR>')
map("n", "<leader>dsi", ':lua require"dap".step_into()<CR>')
map("n", "<leader>dsv", ':lua require"dap".step_over()<CR>')
map("n", "<leader>dc", ':lua require"dap".continue()<CR>')
map("n", "<leader>db", ':lua require"dap".toggle_breakpoint()<CR>')

-- telescope-dap
map("n", "<leader>dcc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
map("n", "<leader>dco", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
map("n", "<leader>dlb", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
map("n", "<leader>dv", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
map("n", "<leader>df", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

-- map("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>')
-- map("n", "<leader>dk", ':lua require"dap".up()<CR>')
-- map("n", "<leader>dj", ':lua require"dap".down()<CR>')
-- map("n", "<leader>dc", ':lua require"dap".terminate()<CR>')
-- map("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
-- map("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
-- map("n", "<leader>da", ':lua require"debugHelper".attach()<CR>')
-- map("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')
-- map("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>')
-- map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')
