-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap

local opt = {
  noremap = true,
  silent = true,
}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)
map("n", "<leader>t", ":terminal<CR>", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)
map("n", "sth", ":sp | terminal<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

--------------------------------------------------------------------
-- 插件快捷键
-- nvimTree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
--
-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete<CR>", opt)
-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

---

local pluginKeys = {}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    bock = "gb",
  },
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  mapbuf("n", "<gk>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- leader + =
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end

----- diffview ----
local status_ok, diffConfig = pcall(require, "diffview.config")
if status_ok then
  map("n", "<leader>df", ":DiffviewOpen<CR>", opt)
  map("n", "<leader>dfc", ":DiffviewClose<CR>", opt)
  map("n", "<leader>dfh", ":DiffviewFileHistory<CR>", opt)
  local cb = diffConfig.diffview_callback
  pluginKeys.diffview = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      -- ["<tab>"]      = cb("select_next_entry"),  -- Open the diff for the next file
      -- ["<s-tab>"]    = cb("select_prev_entry"),  -- Open the diff for the previous file
      -- ["gf"]         = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      -- ["<C-w><C-f>"] = cb("goto_file_split"),    -- Open the file in a new split
      -- ["<C-w>gf"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      -- ["<leader>e"]  = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
      ["o"] = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"] = cb("stage_all"), -- Stage all entries.
      ["U"] = cb("unstage_all"), -- Unstage all entries.
      ["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
      ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["gf"] = cb("goto_file"),
      ["<C-w><C-f>"] = cb("goto_file_split"),
      ["<C-w>gf"] = cb("goto_file_tab"),
      ["i"] = cb("listing_style"), -- Toggle between 'list' and 'tree' views
      ["f"] = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"] = cb("options"), -- Open the option panel
      ["<C-A-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
      ["y"] = cb("copy_hash"), -- Copy the commit hash of the entry under the cursor
      ["zR"] = cb("open_all_folds"),
      ["zM"] = cb("close_all_folds"),
      ["j"] = cb("next_entry"),
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"),
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"),
      ["o"] = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["gf"] = cb("goto_file"),
      ["<C-w><C-f>"] = cb("goto_file_split"),
      ["<C-w>gf"] = cb("goto_file_tab"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"] = cb("close"),
    },
  }
end

-- gitsigns
pluginKeys.gitsigns = {
  -- Default keymap options
  noremap = true,

  ["n <leader>hj"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
  ["n <leader>hk"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

  -- stage
  ["n <leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",
  ["v <leader>hs"] = ":Gitsigns stage_hunk<CR>",
  ["n <leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
  ["n <leader>hS"] = "<cmd>Gitsigns stage_buffer<CR>",
  ["n <leader>hU"] = "<cmd>Gitsigns reset_buffer_index<CR>",

  -- reset
  ["n <leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",
  ["v <leader>hr"] = ":Gitsigns reset_hunk<CR>",
  ["n <leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",

  ["n <leader>hp"] = "<cmd>Gitsigns preview_hunk<CR>",
  ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line{full=false}<CR>',

  -- Text objects
  ["o ih"] = ":<C-U>Gitsigns select_hunk<CR>",
  ["x ih"] = ":<C-U>Gitsigns select_hunk<CR>",
}

return pluginKeys

-- let g:vimspector_enable_mappings = 'HUMAN'
-- nmap <leader>dd :call vimspector#Launch()<CR>
-- nmap <leader>dx :call vimspectorReset<CR>
-- nmap <leader>de :call vimspectorEval
-- nmap <leader>dw :call vimspectorWatch
