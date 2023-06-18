local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall( require, 'packer' )
if ( not status ) then
	print( "Packer Is Not Installed" )
	return
end
vim.cmd [[packadd packer.nvim]]
packer.startup( function( use )
	use 'wbthomason/packer.nvim'
	use { "catppuccin/nvim", as = "catppuccin" } -- theme 
	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	-- autocomplete
	use 'hrsh7th/nvim-cmp' -- completion 
	use 'hrsh7th/cmp-nvim-lsp' -- nvim lsp completion
	use 'hrsh7th/cmp-buffer' -- buffer words 
	use 'hrsh7th/cmp-cmdline' -- cmd line usage
	use 'hrsh7th/cmp-path' -- file paths 
	use 'onsails/lspkind-nvim' -- autocomplete icons 
	-- snippet
	use 'dcampos/nvim-snippy'
	use 'dcampos/cmp-snippy'
	-- treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- autopair
	use 'windwp/nvim-autopairs'
	-- plugin support
	use 'nvim-lua/plenary.nvim'
	-- icons
	use 'kyazdani42/nvim-web-devicons'
	-- colorizer
	use 'norcalli/nvim-colorizer.lua'
	-- gitsigns
	use 'lewis6991/gitsigns.nvim'
	-- indent blankline
	use 'lukas-reineke/indent-blankline.nvim'
	-- Lualine
	use 'nvim-lualine/lualine.nvim'
	-- Cursor flash
	use 'rainbowhxch/beacon.nvim'
	-- markdown 
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	-- file tree explorer or file manager
	use { 'luukvbaal/nnn.nvim', config = function() require( "nnn" ).setup() end }
end )

require( 'PluginConfs.catppuccinRC' )
require( 'PluginConfs.lspconfigRC' )
require( 'PluginConfs.masonRC' )
require( 'PluginConfs.lspkindRC' )
require( 'PluginConfs.nvimCmpRC' )
require( 'PluginConfs.autopairsRC' )
require( 'PluginConfs.treesitterRC' )
require( 'PluginConfs.colorizerRC' )
require( 'PluginConfs.gitsignsRC')
require( 'PluginConfs.lualineRC' )
require( 'PluginConfs.beaconRC' )
require( 'PluginConfs.nnnRC')
