local status, typescript = pcall(require, "typescript")
if not status then
  vim.notify("没有找到 typescript")
  return
end

local uConfig = require("uConfig")
local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    -- common.disableFormat(client)
    common.keyAttach(bufnr)

    --[[ 
        :TypescriptOrganizeImports
        :TypescriptRenameFile
        :TypescriptAddMissingImports
        :TypescriptRemoveUnused
        :TypescriptFixAll
        :TypescriptGoToSourceDefinition 
    ]]

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", uConfig.lsp.ts_organize, ":TypescriptOrganizeImports<CR>", bufopts)
    keymap("n", uConfig.lsp.ts_rename_file, ":TypescriptRenameFile<CR>", bufopts)
    keymap("n", uConfig.lsp.ts_add_missing_import, ":TypescriptAddMissingImports<CR>", bufopts)
    keymap("n", uConfig.lsp.ts_remove_unused, ":TypescriptRemoveUnused<CR>", bufopts)
    keymap("n", uConfig.lsp.ts_fix_all, ":TypescriptFixAll<CR>", bufopts)
    keymap("n", uConfig.lsp.ts_goto_source, ":TypescriptGoToSourceDefinition<CR>", bufopts)
  end,
}
return {
  on_setup = function(_)
    typescript.setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
      },
      server = opts,
    })
  end,
}
