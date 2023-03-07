-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fzf for nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Color scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Language parser + syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    {run = ':TSUpdate'}
  }

  -- local git for nvim
  use('mbbill/undotree')

  -- actual git integration nvim
  use('tpope/vim-fugitive')

  -- github integration with fugitive
  use {
    'tpope/vim-rhubarb',
    requires = {'tpope/vim-fugitive'}
  }

  -- filetree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- harpoon
  use('theprimeagen/harpoon')
  
end)
