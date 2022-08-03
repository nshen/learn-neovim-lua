return {
  on_setup = function(server)
    server.setup({
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        require("lsp.common-config").disableFormat(client)
        require("lsp.common-config").keyAttach(bufnr)
      end,
    })
  end,
}
