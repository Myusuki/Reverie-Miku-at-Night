return {
	'onsails/lspkind-nvim',
	event = InsertEnter,
	config = function ()
		require('lspkind').init({
			-- default: true
			-- with_text = true,

			-- defines how annotations are shown
			-- default: symbol
			-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			mode = 'text',
		} )
	end,
}
