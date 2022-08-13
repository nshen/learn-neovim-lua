local uConfig = require("uConfig")
local uComment = uConfig.comment

if uComment == nil or not uComment.enable then
  return
end

local status, comment = pcall(require, "Comment")
if not status then
  vim.notify("没有找到 Comment")
  return
end

local opts = {
  mappings = {
    -- 关闭了extra快捷键
    extra = false,
  },

  -- Normal 模式快捷键
  toggler = {
    line = uComment.toggler.line, -- 行注释
    block = uComment.toggler.block, -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = uComment.opleader.line,
    bock = uComment.opleader.block,
  },

  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  pre_hook = function(ctx)
    local U = require("Comment.utils")
    -- Determine whether to use linewise or blockwise commentstring
    local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"
    -- Determine the location where to calculate commentstring from
    local location = nil
    if ctx.ctype == U.ctype.blockwise then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end
    return require("ts_context_commentstring.internal").calculate_commentstring({
      key = type,
      location = location,
    })
  end,
}

-- ctrl + /
-- map("n", "<C-->", "gcc", {
--   noremap = false,
-- })
-- map("v", "<C-_>", "gc", {
--   noremap = false,
-- })

comment.setup(opts)
