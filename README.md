# learn-neovim-lua


## language server

`:h lsp`

``````
1. Install the nvim-lspconfig plugin.  It provides common configuration for
    various servers so you can get started quickly.
    https://github.com/neovim/nvim-lspconfig
2. Install a language server. A list of language servers can be found here:
    https://microsoft.github.io/language-server-protocol/implementors/servers/
    See individual server documentation for installation instructions.
3. Add `lua require('lspconfig').xx.setup{…}` to your init.vim, where "xx" is
    the name of the relevant config. See the nvim-lspconfig README for details.
    NOTE: Make sure to restart nvim after installing and configuring.
4. Check that an LSP client has attached to the current buffer:  >

    :lua print(vim.inspect(vim.lsp.buf_get_clients()))
``````

https://github.com/typescript-language-server/typescript-language-server



正在写。。
