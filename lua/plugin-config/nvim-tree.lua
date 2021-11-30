-- https://github.com/kyazdani42/nvim-tree.lua
require'nvim-tree'.setup {
    -- 关闭文件时自动关闭
    auto_close = true,
    -- 不显示 git 状态图标
    git = {
        enable = false
    }
}
