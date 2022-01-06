-- https://github.com/kyazdani42/nvim-tree.lua
local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup({
  -- 关闭文件时自动关闭
  auto_close = true,
  -- 不显示 git 状态图标
  git = {
    enable = false,
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    cmd = "wsl-open",
  },
  -- project plugin
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏文件
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  view = {
    width = 30,
    height = 30,
    -- 隐藏根目录
    hide_root_folder = true,
    side = "left",
    -- 打开第一个文件
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "v", cb = tree_cb("vsplit") }, -- 只有这个不是默认值
        { key = "I", cb = tree_cb("toggle_ignored") }, -- Ignore (node_modules)
        { key = "H", cb = tree_cb("toggle_dotfiles") }, -- Hide (dotfiles)
        { key = "a", cb = tree_cb("create") },
        { key = "d", cb = tree_cb("remove") },
        { key = "R", cb = tree_cb("refresh") },
        { key = "s", cb = tree_cb("system_open") },
      },
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
})
