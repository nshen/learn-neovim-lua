return {
  on_setup = function(server)
    server.setup({
      settings = {
        yaml = {
          format = {
            enable = true,
          },
          schemas = {
            ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          },
        },
      },
      on_attach = function(_, bufnr)
        require("lsp.common-config").keyAttach(bufnr)
      end,
    })
  end,
}
