--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
  capabilities = capabilities
}
