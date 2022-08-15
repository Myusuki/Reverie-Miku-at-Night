vim.cmd [[ "autocmd!" ]]

local map = vim.keymap

vim.g.mapleader = '`'

map.set( 'n', '<Leader>so', ':so $MYVIMRC<cr>' )
map.set( 'n', '<Leader>pi', ':PackerInstall<cr>' )
map.set( 'n', '<Leader>pc', ':PackerClean<cr>' )
map.set( 'n', '<Leader>ls', ':LspStart<cr>' )
