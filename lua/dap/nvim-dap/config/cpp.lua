local M = {}

function M.setup()
  local dap = require("dap")
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = "executable",
    -- change to your path
    -- if can not find OpenDebugAD7, please install cpptools by mason
    command = "/home/lzr/.local/share/nvim/mason/bin/OpenDebugAD7",
  }
  dap.configurations.cpp = {
    -- launch exe
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
      setupCommands = {
        {
          description = 'enable pretty printing',
          text = '-enable-pretty-printing',
          ignoreFailures = false
        },
      },
    },
    -- attach process
    {
      name = "Attach process",
      type = "cppdbg",
      request = "attach",
      processId = require('dap.utils').pick_process,
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "${workspaceFolder}",
      setupCommands = {
        {
          description = 'enable pretty printing',
          text = '-enable-pretty-printing',
          ignoreFailures = false
        },
      },
    },
    -- attach server
    {
      name = 'Attach to gdbserver :1234',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      -- setupCommands = {
        -- {
          -- text = '-enable-pretty-printing',
          -- description = 'enable pretty printing',
          -- ignoreFailures = false
        -- },
      -- },
    },
  }

  -- setup other language
  dap.configurations.c = dap.configurations.cpp
end

return M
