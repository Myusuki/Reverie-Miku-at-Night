local status, autopairs = pcall( require, 'nvim-autopairs' )
if ( not status ) then
	return
end
local Rule = require( 'nvim-autopairs.rule' )
local cond = require( 'nvim-autopairs.conds' )

autopairs.setup {
	disable_filetype = { 'TelescopePrompt', 'vim' }
}
