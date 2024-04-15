return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	event = BufEnter,
	config = function()
		local ts = require( 'nvim-treesitter.configs' )

		ts.setup{
			highlight = {
				enable = true,
				disable = {}, 
			},
			indent = {
				enable = true,
				disable = {},
			},
			ensure_installed = { 'c', 'cpp', 'bash', 'lua', 'latex', 'markdown', 'make', 'java' },
		}
	end,
}
