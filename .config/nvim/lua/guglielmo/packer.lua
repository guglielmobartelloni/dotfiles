-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'NLKNguyen/papercolor-theme'
  use { "ellisonleao/gruvbox.nvim" }
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  use 'fatih/vim-go'
  use {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
  }
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
      require("toggleterm").setup()
  end}
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  end)
