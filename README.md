## 📜 学习 Neovim 全 lua 配置

本人常年在 `Windows` 系统上做前端开发，虽然已经使用 “`VIM`” 好多年了，但一直使用的都是 [VSCodeVim](https://github.com/VSCodeVim/Vim)，

中间曾尝试配置过几次原生的 `VIM`，包括各种 `GUI` 的版本，最终都放弃了。

主要原因一个是 `VSCode` 实在是太强大了，应用商店有各种插件，涵盖 Web 开发的方方面面，装上基本不用配置就非常非常好用了。
早期 `VSCode` 上的有好几个 vim 相关的插件，各有各的 bug。但后期 [VSCodeVim](https://github.com/VSCodeVim/Vim) 被收编后就统一了，
有了微软的投入也变的足够好用了。最主要的是，我可以混用 `VIM` 的快捷键和 `VSCode` 的原生功能，比如 `Ctrl + p` 打开的无敌窗口等。

而 `VIM` 这边配置太原始了，要在 `vimrc` 里写一堆看不懂的配置才能满足最基本使用。代码提示也不够智能，费大劲配置出来效果还也不如 `VSCode` 默认配置。
而且在 Windows 上的支持也不是很好，除了在服务器上开发，在本地根本没有任何优势。

但状况随着时间的推移有了新变化，随着 [WSL 2](https://docs.microsoft.com/en-us/windows/wsl/) 和 [Windows Terminal](https://www.microsoft.com/zh-cn/p/windows-terminal)
的推出，Windows 命令行也有了 Unicode、和 UTF-8 字符支持，GPU 加速文本渲染引擎等支持。

而 [Neovim](https://github.com/neovim/neovim) 0.5.x 正式版推出后，内置了 LSP（[Language Server Protocol](https://microsoft.github.io/language-server-protocol/)），代码提示的体验已经跟 `VSCode` 看齐了。
`Lua` 成了编辑器的一等语言，配置更易懂了，众多 `VIM` 插件都有了 `Lua` 原生版本，配置也没有那么硬核了，使得 `Vim` 更加现代化了，也更易用了。

反而 `VSCode` 这边不断的加我用不到的功能，感觉越来越慢了，最烦的是 VSCode 并不能完全的脱离鼠标，总有不得不用鼠标去点的按钮。

所以我又一次尝试了逃离 `VSCode`，使用下来感觉良好，常用的功能都没问题，而且可以完全脱离鼠标了。

先看运行效果：

![neovim run in wsl2](./docs/imgs/gif1.gif)

本文将介绍我如何在 `Windows` 命令行环境下使用全 lua 配置 `Neovim`，以及各种常用插件的配置和使用方法。

其他系统用户可以跳过第一章，从第二章开始。

## 📃 目录

- 🏆 [在 Windows Terminal 与 WSL 2 下安装 Neovim](./docs/windows-terminal-wsl2.md)
- 🛠 [Neovim 基础配置](./docs/basic-config.md)
- 🖐 [Neovim 快捷键配置](./docs/keybindings.md)
- 📦 [Neovim 插件管理与配置](./docs/packer-usage.md)
- 🎭 [Neovim 主题配置](./docs/colorscheme.md)
- 🛒 常用插件配置
  - 📌 [nvim-tree 侧边栏插件](./docs/plugins/nvim-tree.md)
  - 📌 [bufferline Tab 页插件](./docs/plugins/bufferline.md)
  - 📌 [nvim-treesitter 语法高亮插件](./docs/plugins/nvim-treesitter.md)
  - 📌 telescope
  - 📌 surround
  - 📌 Comment
  - 📌 nvim-coloizer
- ✨ 内置 LSP 配置
  - 📌 [基础配置](./docs/lsp.md)
  - 📌 代码补全
- ⚔ 前端开发配置
- 🦀 rust 开发配置
- 🎉 直接使用我的配置

## ❤ 感谢

本文 + 配置源码，随着我的习惯改变，会在 [github.com/nshen/learn-neovim-lua](https://github.com/nshen/learn-neovim-lua) 永久更新，欢迎订阅。

任何问题欢迎 [留言](https://github.com/nshen/learn-neovim-lua/issues)，共同进步，谢谢。

本作品采用 <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议</a> 进行许可。

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
