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

local map = vim.api.nvim_set_keymap
-- leader key
vim.g.mapleader = '`'

-- leader hotkey functions
local options = {noremap = true}
map('n', '<leader>so', ':so $MYVIMRC<cr>', options)
-- map('n', '<leader>ls', ':LspStart<cr>', options)
-- map('n', '<leader>li', ':LspInstallInfo<cr>', options)
-- map('n', '<leader>z', ':TZAtaraxis<CR>', options)

