-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/onsails/lspkind-nvim

local cmp = require("cmp")
local luasnip = require("luasnip")
local config = require("keybindings")

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local selectNext = cmp.mapping(function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif vim.fn["vsnip#available"](1) == 1 then
		feedkey("<Plug>(vsnip-expand-or-jump)", "")
	elseif has_words_before() then
		cmp.complete()
	else
		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
	end
end, { "i", "s" })

local selectPreview = cmp.mapping(function()
	if cmp.visible() then
		cmp.select_prev_item()
	elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		feedkey("<Plug>(vsnip-jump-prev)", "")
	end
end, { "i", "s" })

local mapping = {
	-- 确认 如果设置了select为true,并且没有选择item时,会默认选择第一个
	[config.cmp.cmp_confirm] = cmp.mapping.confirm({
		select = true,
		behavior = cmp.ConfirmBehavior.Replace,
	}),
	-- 如果窗口内容太多，可以滚动
	[config.cmp.cmp_scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	[config.cmp.cmp_scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

	-- 上一个
	[config.cmp.cmp_select_prev_item] = selectPreview,
	["<S-Tab>"] = selectPreview,
	-- 下一个
	[config.cmp.cmp_select_next_item] = selectNext,
	["<Tab>"] = selectNext,
}

cmp.setup({
	-- 指定 snippet 引擎 luasnip
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	-- 快捷键
	-- mapping = mapping,
	mapping = mapping,
	-- 来源
	sources = cmp.config.sources({
		{ name = "luasnip", group_index = 1 },
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "nvim_lsp_signature_help", group_index = 1 },
		{ name = "buffer", group_index = 2 },
		{ name = "path", group_index = 2 },
	}),

	-- 使用lspkind-nvim显示类型图标
	formatting = require("cmp.lspkind").formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.setup.filetype({ "markdown", "help" }, {
	sources = {
		{ name = "buffer" },
		{ name = "path" },
	},
})

require("cmp.luasnip")
