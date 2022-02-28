vim.fn.stdpath('data')

对应目录

~/.local/share/nvim:

## 组件被安装的目录

~/.local/share/nvim/site/pack/packer/start
~/.local/share/nvim/site/pack/packer/opt

use 'user/repo'

:`PackerClean`
:PackerStatus 查看安装了多少个插件
:PackerUpdate: 更新插件
:PackerSync: 更新并且编译

## 前端

yarn global add eslint_d

## null-ls

`:lua vim.lsp.buf.formatting_sync()`


--[[

language server config

https://github.com/typescript-language-server/typescript-language-server
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md



打开

`:LspInstallInfo` 查看安装信息

## language server

`:h lsp`

- https://github.com/typescript-language-server/typescript-language-server
- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

`yarn global add vscode-langservers-extracte`

## emmet

https://www.npmjs.com/package/ls_emmet

## Vsnip

:VsnipOpen

## rust

先安装 language server， 手动安装

https://rust-analyzer.github.io/

```bash
git clone https://github.com/rust-analyzer/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server
```

如果提示错误，先升级 `cargo`

```
rustup update stable
```

安装成功

```bash
rust-analyzer --version
```

有输出证明安装成功


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



--]]



## telescope

`:checkhealth telescope`  检查安装情况，提示 `ripgrep` 不存在

```bash
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt install ripgre
```
fd 不存在

`npm install -g fd-find`


设置keybinding

## dev


-- local timer = vim.loop.new_timer()
-- timer:start(
--   1000,
--   1000,
--   vim.schedule_wrap(function()
--     vim.api.nvim_command('echomsg "test"')
--   end)
-- )
vim.cmd([[
 au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
]])

vim.ui.input("sjfldsjf", function(inp)
  print("ans:" .. vim.inspect(inp))
end)

sudo apt install python3
sudo apt install python3-pip
VimspectorInstall CodeLLDB
