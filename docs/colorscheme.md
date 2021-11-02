##  未完成----------------

## colorscheme


https://github.com/shaunsingh/nord.nvim


in `~/.config/nvim/lua/plugins/init.lua`

```lua
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- If you are using Packer
  use 'shaunsingh/nord.nvim'
end)
```

in `~/.config/nvim/init.lua`

```lua
require('plugins')
vim.cmd('colorscheme nord')
```
