local ls = require("luasnip")
local config = require("keybindings")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_lua").load({ paths = config.cmp.config_path .. "/lua/cmp/snippets/" })
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				-- virt_text = { { "choiceNode", "Comment" } },
				virt_text = { { "<--", "Error" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, config.cmp.snip_jump_next, function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)

vim.keymap.set({ "i", "s" }, config.cmp.snip_jump_prev, function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vim.keymap.set({ "i", "s" }, config.cmp.snip_next_choice, function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, config.cmp.snip_prev_choice, function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)
