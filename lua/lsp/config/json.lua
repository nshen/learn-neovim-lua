return {
  on_setup = function(server)
    server.setup({
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },

      -- use fixjson to format
      -- https://github.com/rhysd/fixjson
      on_attach = function(client, bufnr)
        require("lsp.common-config").disableFormat(client)
        require("lsp.common-config").keyAttach(bufnr)
      end,
    })
  end,
}
