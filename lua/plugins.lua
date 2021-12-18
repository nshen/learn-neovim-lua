return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -------------------------- plugins -------------------------------------------

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Comment
  use 'numToStr/Comment.nvim'

  -- nvim-autopairs
  use 'windwp/nvim-autopairs'
  -------------------------- lsp -------------------------------------------

  -- lspconfig
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'
  -- use 'github/copilot.vim'

  use 'simrat39/rust-tools.nvim'
  --------------------------- colorscheme ------------------------------------

  -- gruvbox
  use {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
  }
  -- zephyr
  use 'glepnir/zephyr-nvim'
  -- nord
  use 'shaunsingh/nord.nvim'
  -- onedark
  use 'ful1e5/onedark.nvim'
  ------------------------------------
  --
  -- which-key
  -- use 'folke/which-key.nvim'

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- use {
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }



  -- rust-tools
  -- use 'simrat39/rust-tools.nvim'
  -- nvim-cmp
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-vsnip'
  -- vsnip
  -- use 'hrsh7th/vim-vsnip'
  -- use "rafamadriz/friendly-snippets"
  -- use 'nvim-autopairs'
  -- use "windwp/nvim-autopairs"
  -- surround
  -- use "blackCauldron7/surround.nvim"
  -- nvim-coloizer
  -- use 'norcalli/nvim-colorizer.lua'
end)

