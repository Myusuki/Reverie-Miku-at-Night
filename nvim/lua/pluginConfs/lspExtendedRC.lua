local status, saga = pcall( require, 'lspsaga' )
if ( not status ) then
	return
end

saga.init_lsp_saga {
	server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'lj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'lh', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'lf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'ls', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'lp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'lr', '<Cmd>Lspsaga rename<CR>', opts)
