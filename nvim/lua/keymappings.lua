vim.cmd [[ "autocmd!" ]]

local map = vim.keymap

vim.g.mapleader = ';'

map.set( 'n', '<Leader>so', ':so $MYVIMRC<cr>' )
