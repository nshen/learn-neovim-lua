-- I use kitty as my terminal on macOS:
-- in ~/.config/kitty/kitty.conf, I added this:
-- macos_option_as_alt yes
-- This allows Opt to act as Alt.

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
	noremap = true,
	silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

--- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)
map("n", "<C-e>", "3<C-e>", opt)
map("n", "<C-y>", "3<C-y>", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
map("n", "<leader>sl", ":vsp<CR>", opt)
map("n", "<leader>sj", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>cc", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>co", "<C-w>o", opt)

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-Down>", ":resize -2<CR>", opt)
map("n", "<C-Up>", ":resize +2<CR>", opt)

-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
-- map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
	{ key = { "o", "<CR>", "<2-LeftMouse>" }, action = "edit" },
	{ key = "<A-o>", action = "system_open" },
	{ key = "p", action = "parent_node" },
	-- v分屏打开文件
	{ key = "v", action = "vsplit" },
	-- h分屏打开文件
	{ key = "s", action = "split" },
	-- Hide (dotfiles)
	{ key = "I", action = "toggle_ignored" },
	{ key = ".", action = "toggle_dotfiles" },
	-- 文件操作
	{ key = "R", action = "refresh" },
	{ key = "i", action = "toggle_file_info" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	-- 进入层级
	{ key = { "cd" }, action = "cd" },
	{ key = { "-" }, action = "dir_up" },
	-- 同目录文件跳转
	{ key = { "<" }, action = "prev_sibling" },
	{ key = { ">" }, action = "next_sibling" },
}
-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<A-w>", ":Bdelete!<CR>", opt)

-- 关闭左/右侧标签页
map("n", "<A-w>h", ":BufferLineCloseLeft<CR>", opt)
map("n", "<A-w>l", ":BufferLineCloseRight<CR>", opt)

-- 关闭其他标签页
map("n", "<A-w>o", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<A-w>p", ":BufferLinePickClose<CR>", opt)

-- Telescope
map("n", "<A-p>", ":Telescope find_files<CR>", opt)
map("n", "<A-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
	},

	-- 按下esc使用n模式
	n = {
		["s"] = "select_horizontal",
		["v"] = "select_vertical",

		-- 关闭窗口
		["<C-c>"] = "close",
	},
}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
	-- Normal 模式快捷键
	toggler = {
		line = "gcc", -- 行注释
		-- block = "cb", -- 块注释
	},
	-- Visual 模式
	opleader = {
		line = "gc",
		-- bock = "gb",
	},
}
-- ctrl + /
map("n", "<C-_>", "gccj", { noremap = false })
map("v", "<C-_>", "gcj", { noremap = false })

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	-- rename
	-- Lspsaga 替换 rn
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)

	-- code action
	-- Lspsaga 替换 ca
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

	-- go xx
	--[[
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
	mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
	--[[
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	Lspsaga 替换 gh
  --]]
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	--[[
	Lspsaga 替换 gr
	mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
	Lspsaga 替换 gp, gj, gk
	mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	-- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = {
	config_path = vim.fn.stdpath("config"),

	-- cmp 快捷键
	cmp_confirm = "<CR>",
	cmp_scroll_doc_up = "<C-b>",
	cmp_scroll_doc_down = "<C-f>",
	cmp_select_prev_item = "<C-p>",
	cmp_select_next_item = "<C-n>",

	-- luasnip
	snip_jump_next = "<C-l>",
	snip_jump_prev = "<C-h>",
	snip_next_choice = "<C-j>",
	snip_prev_choice = "<C-k>",
}

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>tf 浮动
-- <leader>tl 右侧
-- <leader>tj 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
	vim.keymap.set({ "n", "t" }, "<leader>tf", toggleterm.toggleA)
	vim.keymap.set({ "n", "t" }, "<leader>tl", toggleterm.toggleB)
	vim.keymap.set({ "n", "t" }, "<leader>tj", toggleterm.toggleC)
	vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

return pluginKeys
