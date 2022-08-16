local status, gitsigns = pcall( require, 'gitsigns' )
if ( not status ) then
	return
end

gitsigns.setup {
signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '^', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },

}
