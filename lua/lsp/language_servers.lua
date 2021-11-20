
--[[ 

language server config

https://github.com/typescript-language-server/typescript-language-server
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md 

--]]

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true


require'lspconfig/configs'.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
      'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
    root_dir = function(fname)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

-- Use a lop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'html', 'rust_analyzer', 'tsserver','ls_emmet' }
local nvim_lsp = require('lspconfig')
for _, server in ipairs(servers) do
  nvim_lsp[server].setup {
    capabilities = capabilities,
    on_attach = require('keybindings').lsp_on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true



