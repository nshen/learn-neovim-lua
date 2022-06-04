_G.usePlugin("toggleterm", function(toggleterm)
	toggleterm.setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.3
			end
		end,
		start_in_insert = true,
	})

	local Terminal = require("toggleterm.terminal").Terminal

	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",
		float_opts = {
			border = "double",
		},
		on_open = function(term)
			vim.cmd("startinsert!")
			-- q / <leader>tg 关闭 terminal
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>tg", "<cmd>close<CR>", { noremap = true, silent = true })
			-- ESC 键取消，留给lazygit
			if vim.fn.mapcheck("<Esc>", "t") ~= "" then
				vim.api.nvim_del_keymap("t", "<Esc>")
			end
		end,
		on_close = function(_)
			-- 添加回来
			vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
				noremap = true,
				silent = true,
			})
		end,
	})

	local ta = Terminal:new({
		direction = "float",
		close_on_exit = true,
	})

	local tb = Terminal:new({
		direction = "vertical",
		close_on_exit = true,
	})

	local tc = Terminal:new({
		direction = "horizontal",
		close_on_exit = true,
	})

	local M = {}

	M.toggleA = function()
		if ta:is_open() then
			ta:close()
			return
		end
		tb:close()
		tc:close()
		ta:open()
	end

	M.toggleB = function()
		if tb:is_open() then
			tb:close()
			return
		end
		ta:close()
		tc:close()
		tb:open()
	end

	M.toggleC = function()
		if tc:is_open() then
			tc:close()
			return
		end
		ta:close()
		tb:close()
		tc:open()
	end

	M.toggleG = function()
		lazygit:toggle()
	end

	require("keybindings").mapToggleTerm(M)
end)
