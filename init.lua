-- require("impatient")
require("utils.global")

-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 自动命令
require("autocmds")

-- 内置LSP
require("lsp")
-- 自动补全
require("cmp.cmp")
-- 格式化
require("format")
-- DAP
-- require("dap.vimspector")
require("dap.nvim-dap")
-- utils
-- 复制到windows剪贴板
-- require('utils.fix-yank')
