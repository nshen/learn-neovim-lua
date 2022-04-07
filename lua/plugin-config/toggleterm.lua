local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("没有找到 toggleterm")
  return
end

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>t]],
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  -- direction =  'vertical' | 'horizontal' | 'window' | "float",
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single', -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- width = 1,
    -- height = 1,
    -- winblend 必须注释掉，否则tokyonight 不可用
    -- winblend = 3,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})

local Terminal = require('toggleterm.terminal').Terminal
local node = Terminal:new({ cmd = 'node', hidden = true })

function _NODE_TOGGLE()
  node:toggle()
end

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    log(term)
    vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
