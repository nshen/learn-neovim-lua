return {
  on_setup = function(server)
    server.setup({
      on_attach = function(_, bufnr)
        require("lsp.common-config").keyAttach(bufnr)
      end,
    })
  end,
}
