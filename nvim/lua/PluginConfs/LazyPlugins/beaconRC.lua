return {
	'rainbowhxch/beacon.nvim',
	event = InsertEnter,
	config = function ()
		local beacon = require( 'beacon' )
		beacon.setup( {
			enable = true,
			size = 100,
			fade = false,
			minimal_jump = 5,
			show_jumps = true,
			focus_gained = false,
			shrink = true,
			timeout = 300,
			ignore_buffers = {},
			ignore_filetypes = {},
		} )
	end,
}
