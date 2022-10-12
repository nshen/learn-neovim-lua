local status, notify = pcall(require, "notify")
if not status then
  vim.notify("没有找到 nvim-notify")
  return
end

notify.setup({
  stages = "static",
  timeout = 5000,
})
vim.notify = notify
