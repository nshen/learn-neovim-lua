-- https://github.com/kyazdani42/nvim-tree.lua
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
  -- project
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
