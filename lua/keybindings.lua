-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制
map("n", "s>", ":vertical resize +20<CR>", opt)
map("n", "s<", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

--------------------------------------------------------------------
-- 插件快捷键
-- nvimTree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":bd<CR>", opt)

-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)

local pluginKeys = {}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- normal 模式
    toggler = {
        line = '<leader>c',
        block = '<leader>bc'
    },
    -- visual 模式
    opleader = {
        -- ctrl + /
        line = '<C-_>',
        block = 'bc'
    }
}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(buf_set_keymap)
    -- rename
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    -- code action
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)

    -- go xx
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)

    -- diagnostic
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
    buf_set_keymap('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
    -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)

    -- leader + =
    buf_set_keymap('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)

    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- 取消
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'})
    }
end

return pluginKeys
