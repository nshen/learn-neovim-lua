local status, ls = pcall(require, "luasnip")
if not status then
  return
end

local status, config = pcall(require, "uConfig")
if not status then
  return
end

local status, types = pcall(require, "luasnip.util.types")
if not status then
  return
end

-- custom snippets
require("luasnip.loaders.from_lua").load({
  paths = config.config_path .. "/lua/cmp/snippets/lua",
})
require("luasnip.loaders.from_vscode").lazy_load({
  paths = config.config_path .. "/lua/cmp/snippets/vscode",
})

-- https://github.com/rafamadriz/friendly-snippets/
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

vim.keymap.set({ "i", "s" }, config.keys.snip_jump_next, function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

vim.keymap.set({ "i", "s" }, config.keys.snip_jump_prev, function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.keymap.set({ "i", "s" }, config.keys.snip_next_choice, function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({ "i", "s" }, config.keys.snip_prev_choice, function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)
