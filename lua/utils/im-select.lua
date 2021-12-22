vim.cmd([[
" 1033 中文语言
" 2052 英文语言
augroup im_select
    autocmd!
    autocmd InsertLeave * silent ! ~/.config/nvim/im-select.exe 1033
    autocmd InsertEnter * silent !~/.config/nvim/im-select.exe 2052
    autocmd BufRead * silent !~/.config/nvim/im-select.exe 1033
augroup END
]])
