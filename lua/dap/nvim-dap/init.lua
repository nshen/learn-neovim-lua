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
dapui.setup({
  element_mappings = {
    scopes = {
      open = "<CR>",
      edit = "e",
      expand = "o",
      repl = "r",
    },
  },

  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.4 },
        "stacks",
        "watches",
        "breakpoints",
        "console",
      },
      size = 0.35, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },

  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
}) -- use default
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

require("dap-go").setup()
require("keybindings").mapDAP()
