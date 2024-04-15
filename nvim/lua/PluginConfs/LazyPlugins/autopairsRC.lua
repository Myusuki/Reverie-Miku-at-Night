return {
	'windwp/nvim-autopairs',
	priority = 900,
	config = function()
		local autopairs = require( 'nvim-autopairs' )
		local Rule = require( 'nvim-autopairs.rule' )
		local cond = require( 'nvim-autopairs.conds' )

		autopairs.setup {
			disable_filetype = { 'TelescopePrompt', 'vim' }
		}
	end,
}
