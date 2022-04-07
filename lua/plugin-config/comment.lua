local status, comment = pcall(require, "Comment")
if not status then
  vim.notify("没有找到 Comment")
  return
end

comment.setup(require('keybindings').comment)
