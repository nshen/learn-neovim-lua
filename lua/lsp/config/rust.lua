local opts = {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
  end,
}

return {
  on_setup = function(server)
    -- Initialize the LSP via rust-tools instead
    require("rust-tools").setup({
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
      dap = require("dap.nvim-dap.rust"),
    })
    server:attach_buffers()
    -- Only if standalone support is needed
    require("rust-tools").start_standalone_if_required()
  end,
}
