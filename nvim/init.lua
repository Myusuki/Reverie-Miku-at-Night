vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.laststatus = 2
vim.o.showmode = false
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false
vim.o.showtabline = 2
vim.bo.syntax = 'ON'
vim.o.hlsearch = true
vim.o.completeopt = "menu,menuone,noselect"
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.autoindent = true

local map = vim.api.nvim_set_keymap
-- leader key 
vim.g.mapleader = '`'

-- leader hotkey functions
options = {noremap = true}
map('n', '<leader>so', ':so $MYVIMRC<cr>', options)
map('n', '<leader>ps', ':PlugInstall<cr>', options)
map('n', '<leader>pc', ':PlugClean<cr>', options)
map('n', '<leader>li', ':LspInstallInfo<cr>', options)

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
-- cosmetics
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'lukas-reineke/indent-blankline.nvim'
-- tools
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/goyo.vim'
Plug 'dense-analysis/ale'
-- autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
vim.call('plug#end')

require('nvim-cmp')
require('lsp')
require('indentline')
require('ale')

-- lualine
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'Miku',
		component_separators = '|',
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'progress'},
		lualine_y = {'encoding', 'fileformat', 'filetype'},
		lualine_z = {'location'},
		},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {},
		},
	tabline = { lualine_a = {'tabs', 'filename'}, },
	extensions = {},
}
