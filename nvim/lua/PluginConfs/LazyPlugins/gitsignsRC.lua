return {
	'lewis6991/gitsigns.nvim',
	event = BufEnter,
	config = function ()
		local gitsigns = require( 'gitsigns' )

		gitsigns.setup {
		signs = {
			add = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
			change = {hl = 'GitSignsChange', text = '^', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
				untracked    = { text = '┆' },
		  },
		}
	end
}
