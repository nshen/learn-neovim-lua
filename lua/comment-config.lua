 require('Comment').setup({
  -- normal 模式
  toggler = {
    line = '<leader>c',
    block = '<leader>bc',
  },
  -- visual 模式
  opleader = {
    -- ctrl + / 
    line = '<C-_>',
    block = 'bc',
  },
 })
