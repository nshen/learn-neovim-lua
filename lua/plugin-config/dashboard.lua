vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_footer = {'https://github.com/nshen/learn-neovim-lua'}

vim.g.dashboard_custom_section = {
  a = { description = {'  Projects              '}, command = 'Telescope projects'},
  b = { description = {'  Recently files        '}, command = 'Telescope oldfiles'},
  -- b = { description = {'  Find file          '}, command = 'Telescope find_files'},
  -- c = { description = {'  Find text          '}, command = 'Telescope live_grep'},
  c = { description = {'  Change colorscheme    '}, command = 'Telescope colorscheme'},
  d = { description = {'  Edit init.lua         '}, command = 'edit ~/.config/nvim/init.lua'},
  e = { description = {'  Edit keybindings      '}, command = 'edit ~/.config/nvim/lua/keybindings.lua'},
  f = { description = {'  Edit Projects         '}, command = 'edit ~/.local/share/nvim/project_nvim/project_history'},
  g = { description = {'  Edit .bashrc          '}, command = 'edit ~/.bashrc'},
}

vim.g.dashboard_custom_header = {
[[███╗   ██╗███████╗██╗  ██╗███████╗███╗   ██╗]],
[[████╗  ██║██╔════╝██║  ██║██╔════╝████╗  ██║]],
[[██╔██╗ ██║███████╗███████║█████╗  ██╔██╗ ██║]],
[[██║╚██╗██║╚════██║██╔══██║██╔══╝  ██║╚██╗██║]],
[[██║ ╚████║███████║██║  ██║███████╗██║ ╚████║]],
[[╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝]],
}

