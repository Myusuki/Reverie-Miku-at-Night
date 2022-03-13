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
map('n', '<leader>wk', ':WhichKey<cr>', options)
map('n', '<leader>ps', ':PackerSync<cr>', options)
map('n', '<leader>pc', ':PackerClean<cr>', options)
-- map('n', '<leader>ls', ':LspStart<cr>', options)
-- map('n', '<leader>li', ':LspInstallInfo<cr>', options)
map('n', '<leader>z', ':TZAtaraxis<cr>', options)

require('statline')
require('TrueZen')
require('indentline')
require('treesit')
require('wk')

local status_ok, packer = pcall( require, 'packer')
if not status_ok then
  return
end

vim.cmd [[ packadd packer.nvim ]]

return packer.startup( function()

  -- Packer
  use 'wbthomason/packer.nvim'
  -- TrueZen
  use "Pocco81/TrueZen.nvim"
  -- indentline
  use 'lukas-reineke/indent-blankline.nvim'
  -- Lush
  use 'rktjmp/lush.nvim'
  use '~/gitdownloads/Miku_lush'
  -- Lualine
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'lewis6991/spellsitter.nvim', }
  -- which-keys
  use { "folke/which-key.nvim" }

end )
