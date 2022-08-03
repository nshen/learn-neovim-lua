return {
  on_setup = function(server)
    server.setup({
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    })
  end,
}
