-- npm install --legacy-peer-deps && npm run compile
require("dap-vscode-js").setup({
  node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = "~/.local/share/nvim/mason/packages/js-debug-adapter", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },

    {
      name = "Edge: localhost:3000",
      type = "pwa-msedge",
      request = "launch",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}/src",
    },

    {
      name = "Chrome: localhost:3000",
      type = "pwa-chrome",
      request = "launch",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}/src",
    },
    {
      type = "chrome",
      request = "launch",
      name = "Next: Chrome",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
    },
    {
      type = "node",
      request = "launch",
      name = "Next: Node",
      outputCapture = "std",
      program = "./node_modules/next/dist/bin/next",
      args = "['dev']",
    },
  }
end
