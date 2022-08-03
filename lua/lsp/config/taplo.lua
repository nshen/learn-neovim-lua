local opts = {
  on_attach = function(client, bufnr)
    require("lsp.common-config").disableFormat(client)
    require("lsp.common-config").keyAttach(bufnr)
  end,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
