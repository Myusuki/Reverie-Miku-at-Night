vim.o.cb = 'unnamedplus'
vim.wo.nu = true
vim.o.sb = true
vim.o.spr = true
vim.o.ls = 2
vim.o.smd = false
vim.wo.wrap = true
vim.wo.lbr = true
vim.wo.list = false
vim.o.stal = 2
vim.bo.syntax = 'ON'
vim.o.hls = true
vim.bo.ts = 2
vim.bo.ai = true
vim.o.completeopt = "menu,menuone,noselect"

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
-- tools
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/goyo.vim'
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

-- nvim-cmp 
local cmp = require'cmp'
cmp.setup({
				snippet = {
								expand = function(args)
												vim.fn["Ultisnips#Anon"](args.body)
								end,
								  },
				mapping = {
								['<C-n>'] = cmp.mapping.scroll_docs(-4),
								['<C-e>'] = cmp.mapping.scroll_docs(4),
								['<C-Space>'] = cmp.mapping.complete(),
								['<C-x>'] = cmp.mapping.close(),
								['<tab>'] = cmp.mapping.confirm({ select = true }),
				     },
				sources = cmp.config.sources({
												{name = 'nvim_lsp'},
												{name = 'ultisnips'},
								},
								{
												{name = 'buffer'},
								})
				})

-- nvim lsp and lsp-installer 
local bmap = vim.api.nvim_buf_set_keymap
local opts = {noremap = true, silent = true}
bmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
bmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
bmap(bufnr, 'n', 'K', '<cmd>lua vim.lps.buf.hover()<CR>', opts)
bmap(bufnr, 'n', '<C-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
bmap(bufnr, 'n', '<C-f>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
bmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

local lsp_installer = require "nvim-lsp-installer"

local servers = {
  "bashls",
  "pyright",
  "clangd",
  "sumneko_lua",
  "remark_ls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

