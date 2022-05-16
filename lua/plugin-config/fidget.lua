local status, fidget = pcall(require, "fidget")
if not status then
  vim.notify("没有找到 fidget")
  return
end

fidget.setup({
  text = {
    spinner = "zip", -- animation shown when tasks are ongoing
    done = "✔", -- character shown when all tasks are complete
    commenced = "Started", -- message shown when task starts
    completed = "Completed", -- message shown when task completes
  },
  sources = {
    ["null-ls"] = {
      ignore = true,
    },
  },
})
