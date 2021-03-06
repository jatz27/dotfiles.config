local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "$HOME/AppData/local/nvim-data/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  -- print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Packer
  use "wbthomason/packer.nvim" -- Restor de paquetes

  -- themes and colorscheme
  use 'navarasu/onedark.nvim' -- colorscheme onedark
  use 'kyazdani42/nvim-web-devicons' --Iconos
  -- Staline
  use 'nvim-lualine/lualine.nvim' -- Status Line
  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- Plugion para complete lsp
  use "hrsh7th/cmp-buffer" -- buffer complete
  use "hrsh7th/cmp-path" -- path complete
  use "hrsh7th/cmp-cmdline" -- cmdline complete
  use "saadparwaiz1/cmp_luasnip" -- snippet complete lua
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- Activa LSP
  use "williamboman/nvim-lsp-installer" -- Gestor para instalar servidores de lenguajes
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-autopairs" -- Autopairs, integrado con cmp y treesitter
  use "numToStr/Comment.nvim" -- Comentarios
  use 'JoosepAlviste/nvim-ts-context-commentstring' --Contexto de comentarios

  --Terminal toggle
  use "akinsho/toggleterm.nvim"
  --  use "voldikss/vim-floaterm"
  -- Maximisa ventanas
  use "szw/vim-maximizer"

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "kdheepak/lazygit.nvim"

  -- Nvim Tree
  use 'kyazdani42/nvim-tree.lua'
  -- Las lineas de los espacios
  use "lukas-reineke/indent-blankline.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  --  if PACKER_BOOTSTRAP then
  --  require("packer").sync()
  -- end
end)
