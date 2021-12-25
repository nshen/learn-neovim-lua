require'lualine'.setup {

  options = {
    component_separators = { left = '|', right = '|'},
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = ' ', right = ''},
    -- theme = 'ayu_dark'
  },
  extensions = { 'nvim-tree'},
  sections = {
    lualine_c = {
      'filename',
      {
        'lsp_progress',
        spinner_symbols =  { ' ', ' ', ' ', ' ', ' ', ' ' },
      },
    },
    lualine_x = {
      'filesize',
      {
        'fileformat',
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      'encoding', 'filetype',
    },
  },
}

