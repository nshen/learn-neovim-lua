local uConfig = require("uConfig")
local uBufferLine = uConfig.bufferLine

if uBufferLine == nil or not uBufferLine.enable then
  return
end

local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("没有找到 bufferline")
  return
end
-- bfferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    -- 关闭 Tab 的命令
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- 侧边栏配置
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- 使用 nvim 内置 LSP
    ---@diagnostic disable-next-line: assign-type-mismatch
    diagnostics = "nvim_lsp",
    -- 可选，显示 LSP 报错图标
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})

-- 左右Tab切换
keymap("n", uBufferLine.prev, ":BufferLineCyclePrev<CR>")
keymap("n", uBufferLine.next, ":BufferLineCycleNext<CR>")
-- "moll/vim-bbye" 关闭当前 buffer
keymap("n", uBufferLine.close, ":Bdelete!<CR>")
-- 关闭左/右侧标签页
keymap("n", uBufferLine.close_left, ":BufferLineCloseLeft<CR>")
keymap("n", uBufferLine.close_right, ":BufferLineCloseRight<CR>")
-- 关闭其他标签页
keymap("n", uBufferLine.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
-- 关闭选中标签页
keymap("n", uBufferLine.close_pick, ":BufferLinePickClose<CR>")
