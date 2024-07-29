-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  "rose-pine/neovim", 
	  as = "rose-pine",
	  config = function() 
		  vim.cmd('colorscheme rose-pine')
	  end
  }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
          {'hrsh7th/cmp-buffer'},
          {"saadparwaiz1/cmp_luasnip"},
	  }
  }
  use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
          require("copilot_cmp").setup()
      end
  }

  use "zbirenbaum/copilot.lua"
  use "onsails/lspkind.nvim"
  use {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      run = "make install_jsregexp",
      requires = {
          "rafamadriz/friendly-snippets",
      }

  }

  use "airblade/vim-gitgutter"

  -- use 'github/copilot.vim'


end)
