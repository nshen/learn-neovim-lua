return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- which-key
  use 'folke/which-key.nvim'
  -- telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  -- lspconfig
  use 'neovim/nvim-lspconfig'
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  -- vsnip
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  -- use 'nvim-autopairs'
  use "windwp/nvim-autopairs"
  -- nvim-tree 
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  -- bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- surround
  use "blackCauldron7/surround.nvim" 
  -- Comment 
  use 'numToStr/Comment.nvim' 
  -- gruvbox theme
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

end)

