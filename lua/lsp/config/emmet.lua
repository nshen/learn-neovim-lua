local opts = {
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
