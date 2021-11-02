##  未完成----------------

## treesitter

语法高亮 Treesitter

- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation

```lua
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- If you are using Packer
  use 'shaunsingh/nord.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
```


`:PackerSync`

`~/.config/nvim/lua/plugnis/init.lua`

```bash
require('plugins')
-- ~/.config/nvim/lua/treesitter-config/init.lua
require('treesitter-config')
vim.cmd('colorscheme nord')
```

报错， 安装 `sudo apt-get install build-essential`
 


## telescope

`:checkhealth telescope`  检查安装情况，提示 `ripgrep` 不存在

```bash
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt install ripgre
```
fd 不存在

`npm install -g fd-find`


设置keybinding



## bufferline.nvim && lualine.nvim

## nvim-tree.lua


## treesitter

- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation

```lua
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- If you are using Packer
  use 'shaunsingh/nord.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
```


`:PackerSync`

`~/.config/nvim/lua/plugnis/init.lua`

```bash
require('plugins')
-- ~/.config/nvim/lua/treesitter-config/init.lua
require('treesitter-config')
vim.cmd('colorscheme nord')
```

报错， 安装 `sudo apt-get install build-essential`
