-- https://github.com/ahmedkhalf/project.nvim
-- 输出保存目录
-- :lua print(require("project_nvim.utils.path").historyfile)
-- 我的文件在
--  ~/.local/share/nvim/project_nvim/project_history

vim.g.nvim_tree_respect_buf_cwd = 1
require("project_nvim").setup {
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = false,

  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = {"pattern"},
  -- detection_methods = { "lsp", "pattern" },

  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },

  -- Table of lsp clients to ignore by name
  -- eg: { "efm", ... }
  ignore_lsp = {},

  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {},

  -- Show hidden files in telescope
  show_hidden = false,

  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,

  -- Path where project.nvim will store the project history for use in
  -- telescope
  datapath = vim.fn.stdpath("data"),
}

require('telescope').load_extension('projects')


