local status, beacon = pcall( require, 'beacon' )
if ( not status ) then
	return
end

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

