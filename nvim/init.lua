vim.o.clipboard = 'unnamedplus' -- clipboard
vim.wo.number = true -- number lines on the side
vim.o.splitright = true -- split windows to the right 
vim.wo.wrap = true -- softwrap 
vim.o.showtabline = 2 -- shows the tabline
vim.bo.syntax = 'ON'
vim.o.hlsearch = true
-- tab length
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
-- colorscheme
vim.o.termguicolors = true
vim.api.nvim_command "colorscheme Miku_lush"

local map = vim.api.nvim_set_keymap
-- leader key
vim.g.mapleader = '`'

-- leader hotkey functions
local options = {noremap = true}
map('n', '<leader>so', ':so $MYVIMRC<cr>', options)
map('n', '<leader>ps', ':PackerSync<cr>', options)
map('n', '<leader>pc', ':PackerClean<cr>', options)
map('n', '<leader>ls', ':LspStart<cr>', options)
map('n', '<leader>li', ':LspInstallInfo<cr>', options)
map('n', '<leader>z', ':TZAtaraxis<cr>', options)

require('statline')
require('TrueZen')
require('indentline')
require('treesit')
require('nvim-cmp')

local status_ok, packer = pcall( require, 'packer')
if not status_ok then
  return
end

vim.cmd [[ packadd packer.nvim ]]

return packer.startup( function()

    -- Packer
  use 'wbthomason/packer.nvim'
  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'tami5/lspsaga.nvim'
  use 'williamboman/nvim-lsp-installer'
  -- nvim-cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy' 
  use 'honza/vim-snippets'
  -- TrueZen
  use "Pocco81/TrueZen.nvim"
  -- indentline
  use 'lukas-reineke/indent-blankline.nvim'
  -- Lush
  use 'rktjmp/lush.nvim'
  use '$HOME/gitdownloads/Miku_lush'
  -- Lualine
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'lewis6991/spellsitter.nvim', }

end )
