ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local myFirstSnippet = s("myFirstSnippet", {
  t("Hi! That is my first snippet in Luasnip"),
  i(1, "placeholder"),
  t("Hi! That is my first snippet in Luasnip"),
})
table.insert(snippets, myFirstSnippet)

local mySecondSnippet = s(
  "mySecondSnippet",
  fmt(
    [[
  local {} = function({})
    {}
  end
  ]],
    {
      i(1, ""),
      c(2, { t("aaa"), t("myArg"), t("3333") }),
      i(3, ""),
    }
  )
)
table.insert(snippets, mySecondSnippet)

return snippets, autosnippets
