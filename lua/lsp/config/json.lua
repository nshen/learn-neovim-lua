local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    -- use fixjson to format
    -- https://github.com/rhysd/fixjson
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
