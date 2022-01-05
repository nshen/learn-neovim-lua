local null_ls = requirePlugin("null-ls")
if not null_ls then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = true,
  sources = {
    -- frontend
    diagnostics.eslint_d,
    code_actions.eslint_d,
    formatting.prettier.with({
      filetypes = { "html", "json", "yaml", "markdown" },
      prefer_local = "node_modules/.bin",
    }),
    -- lua
    formatting.stylua.with({
      filetypes = { "lua" },
    }),
  },
  -- on_attach = function(client)
  -- if client.resolved_capabilities.document_formatting then
  --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  -- end
  -- end,
})
