-- local dap_install = require("dap-install")
-- dap_install.setup({
--   installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
-- })
local status, dap = pcall(require, "dap")
if not status then
  return
end

local status, dapui = pcall(require, "dapui")
if not status then
  return
end

local status, vt = pcall(require, "nvim-dap-virtual-text")
if not status then
  return
end

require("dap.nvim-dap.ui")

vt.setup({
  commented = true,
})

-- https://github.com/rcarriga/nvim-dap-ui
dapui.setup() -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
require("dap.nvim-dap.config.lua").setup()
require("dap.nvim-dap.config.cpp").setup()
require("keybindings").mapDAP()
