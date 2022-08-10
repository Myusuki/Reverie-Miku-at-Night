local status, beacon = pcall( require, 'beacon' )
if ( not status ) then
	return
end

beacon.setup( {
	enable = true,
	size = 100,
	fade = true,
	minimal_jump = 8,
	show_jumps = true,
	focus_gained = true,
	shrink = true,
	timeout = 500,
} )
