local M = {}

M.keyAttach = function(bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
  end
  -- 绑定快捷键
  require("keybindings").mapLSP(buf_set_keymap)
end

-- 禁用格式化功能，交给专门插件插件处理
M.disableFormat = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

return M
