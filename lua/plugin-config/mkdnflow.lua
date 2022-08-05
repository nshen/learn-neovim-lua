local mkd = require("uConfig").mkdnflow
if type(mkd) == "table" and mkd.enable then
  require("mkdnflow").setup({
    modules = {
      maps = false,
    },
    filetypes = { md = true, mdx = true, markdown = true },
    links = {
      style = "markdown",
      implicit_extension = nil,
      transform_implicit = false,
      transform_explicit = function(text)
        text = text:gsub(" ", "-")
        text = text:lower()
        text = os.date("%Y-%m-%d-") .. text
        return text
      end,
    },
  })

  local mkdnflowGroup = vim.api.nvim_create_augroup("mkdnflowGroup", {
    clear = true,
  })
  vim.api.nvim_create_autocmd("FileType", {
    group = mkdnflowGroup,
    pattern = { "markdown", "md", "mdx" },
    callback = function()
      local opts = { buffer = vim.api.nvim_get_current_buf() }
      keymap("n", mkd.next_link, "<cmd>MkdnNextLink<CR>", opts)
      keymap("n", mkd.prev_link, "<cmd>MkdnPrevLink<CR>", opts)
      keymap("n", mkd.prev_heading, "<cmd>MkdnPrevHeading<CR>", opts)
      keymap("n", mkd.next_heading, "<cmd>MkdnNextHeading<CR>", opts)
      keymap("n", mkd.go_back, "<cmd>MkdnGoBack<CR>", opts)
      keymap("n", mkd.follow_link, "<cmd>MkdnFollowLink<CR>", opts)
      keymap("n", mkd.toggle_item, "<cmd>MkdnToggleToDo<CR>", opts)
      keymap({ "n", "x" }, mkd.follow_link, "<cmd>MkdnFollowLink<CR>", opts)
    end,
  })
end
