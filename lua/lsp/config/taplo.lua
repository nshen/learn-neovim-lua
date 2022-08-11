local opts = {
  on_attach = function(_, bufnr)
    require("lsp.common-config").keyAttach(bufnr)
  end,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
