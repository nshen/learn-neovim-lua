local uConfig = require("uConfig")
local uTelescope = uConfig.telescope

if uTelescope == nil or not uTelescope.enable then
  return
end

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- 窗口内快捷键
    mappings = {
      i = {
        -- 上下移动
        [uTelescope.move_selection_next] = "move_selection_next",
        [uTelescope.move_selection_previous] = "move_selection_previous",
        -- 历史记录
        [uTelescope.cycle_history_next] = "cycle_history_next",
        [uTelescope.cycle_history_prev] = "cycle_history_prev",
        -- 关闭窗口
        -- ["<esc>"] = actions.close,
        [uTelescope.close] = "close",
        -- 预览窗口上下滚动
        [uTelescope.preview_scrolling_up] = "preview_scrolling_up",
        [uTelescope.preview_scrolling_down] = "preview_scrolling_down",
      },
    },
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
        initial_mode = "normal",
      }),
    },
  },
})

keymap("n", uTelescope.find_files, ":Telescope find_files<CR>")
keymap("n", uTelescope.live_grep, ":Telescope live_grep<CR>")

pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
