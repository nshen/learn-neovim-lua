vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = { description = {'  Recently used files'}, command = 'Telescope oldfiles'},
  b = { description = {'  Find file          '}, command = 'Telescope find_files'},
  c = { description = {'  Find text          '}, command = 'Telescope live_grep'},
  d = { description = {'  Edit init.lua      '}, command = 'edit ~/.config/nvim/init.lua'},
  e = { description = {'  Edit .bashrc       '}, command = 'edit ~/.bashrc'},
  -- f = { description = {'  Quit Neovim        '}, command = 'qa'},
}
vim.g.dashboard_custom_footer = {'https://github.com/nshen/learn-neovim-lua'}

vim.g.dashboard_custom_header = {
[[███╗   ██╗███████╗██╗  ██╗███████╗███╗   ██╗]],
[[████╗  ██║██╔════╝██║  ██║██╔════╝████╗  ██║]],
[[██╔██╗ ██║███████╗███████║█████╗  ██╔██╗ ██║]],
[[██║╚██╗██║╚════██║██╔══██║██╔══╝  ██║╚██╗██║]],
[[██║ ╚████║███████║██║  ██║███████╗██║ ╚████║]],
[[╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝]],
}

