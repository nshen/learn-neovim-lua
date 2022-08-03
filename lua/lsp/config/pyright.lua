return {
  on_setup = function(server)
    server.setup({
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
