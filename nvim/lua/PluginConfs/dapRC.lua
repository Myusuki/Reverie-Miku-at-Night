local status, dap = pcall( require, "dap" )
if( not status ) then
	return
end

dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = "6006",
}
