_G.usePlugin("indent_blankline", function(indent_blankline)
	indent_blankline.setup({
		-- 空行占位
		space_char_blankline = " ",
		-- 用 treesitter 判断上下文
		show_current_context = true,
		show_current_context_start = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"element",
			"^if",
			"^while",
			"^for",
			"^object",
			"^table",
			"block",
			"arguments",
		},
		-- echo &filetype
		filetype_exclude = {
			"null-ls-info",
			"dashboard",
			"packer",
			"terminal",
			"help",
			"log",
			"markdown",
			"TelescopePrompt",
			"lsp-installer",
			"lspinfo",
			"toggleterm",
		},
		-- 竖线样式
		-- char = '¦'
		-- char = '┆'
		-- char = '│'
		-- char = "⎸",
		char = "▏",
	})
end)
