## Neovim 基础配置

本章介绍 `Neovim` 的基本配置

## 配置文件

Neovim 配置文件不是 `.vimrc`

而是保存在 `~/.config/nvim/init.vim`

也可以直接是 `init.lua` ，为了保证和老版本兼容，或者有一些不知怎么在 `lua` 下配置的，我这里还是使用了 `init.vim`。

但是 `init.vim` 只作为入口，真正的配置，是加载的其他的 `lua` 配置文件

## .vim 中调用 lua

从 `init.vim` 里可以直接写 `lua`代码，这样

```
lua print('单行 lua')
```

多行调用

```
lua <<EOF
print('多行 lua')
print('多行 lua')
EOF
```

## .vim 中加载其他 lua 文件

在 `Neovim` 中加载 `lua` 文件，可以这样

```
" 加载 lua/basic.lua 文件，此行为注释
lua require('basic')
```

目前我的配置文件结构大概是这个样子。 后边章节会逐个介绍

```
├── init.vim                              入口文件，这里负责加载所有lua文件夹里的文件
└── lua                                   所有 lua 配置文件
    ├── basic.lua                         Neovim 的基础配置
    ├── keybindings.lua                   快捷键配置
    ├── lsp                               内置 LSP  (Language Server Protocol) 配置
    │   ├── diagnostic_signs.lua
    │   ├── language_servers.lua
    │   └── nvim-cmp-config.lua
    ├── plugin-config                     各个插件配置在这个文件夹
    │   ├── bufferline.lua
    │   ├── comment.lua
    │   ├── nvim-autopairs.lua
    │   ├── nvim-colorizer.lua
    │   ├── nvim-tree.lua
    │   ├── nvim-treesitter.lua
    │   ├── rust-tools.lua
    │   ├── surround.lua
    │   ├── telescope.lua
    │   └── which-key.lua
    └── plugins.lua                       插件安装管理
```

## init.vim 配置入口

`init.vim` 是入口文件，主要负责加载各个 lua 文件，对应上边的结构。

如果暂时没有找到办法用 `lua` 设置的，就在这里用 `vim` 脚本设置。

先预览一下这个文件最终的样子，本章只需关注 **前两行** ，后边的会在之后的章节介绍

```
" 基础设置
lua require('basic')
" Packer插件管理
lua require('plugins')
" 快捷键映射
lua require('keybindings')
" 皮肤设置
" https://github.com/ellisonleao/gruvbox.nvim
set background=dark " or light if you want light mode
colorscheme gruvbox

" 插件配置
lua require('plugin-config/which-key')
lua require('plugin-config/nvim-treesitter')
lua require('plugin-config/telescope')
lua require('plugin-config/nvim-autopairs')
lua require('plugin-config/nvim-tree')
lua require('plugin-config/bufferline')
lua require('plugin-config/surround')
lua require('plugin-config/comment')
lua require('plugin-config/nvim-colorizer')
lua require('plugin-config/rust-tools')

" lsp
lua require('lsp/nvim-cmp-config')
lua require('lsp/diagnostic_signs')
lua require('lsp/language_servers')
```

## 基础配置 basic.lua

在 `init.vim` 中第一行

```
" 基础设置
lua require('basic')
```

此行会加载对应的 `lua/basic.lua`

这里的配置看着有点多，比 `VSCode` 复杂多了，主要是历史遗留的默认配置不太合理。

其实不用纠结太多，我也是参考了很多大神的配置都差不多，基本可以闭眼直接 copy。

可以根据需要微调，大部分都有注释

```lua
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.o.wrap = false
vim.wo.wrap = false
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间200毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 200
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 2
```

- [init.vim 完整文件](../init.vim)
- [basic.lua 完整文件](../lua/basic.lua)

重启后的 `Neovim` 应该顺眼多了，下一篇介绍我的 Neovim 快捷键配置。

- 下一章： [Neovim 快捷键配置](./keybindings.md)
- [回首页](../README.md)
