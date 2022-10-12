local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(_, bufnr)
    common.keyAttach(bufnr)
    -- common.disableFormat(client)
  end,
  -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
