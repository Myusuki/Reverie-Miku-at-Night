local status, cmp = pcall( require, "cmp" )
if ( not status ) then
	return
end

local lspkind = require ( 'lspkind' )
local snippy = require( "snippy" )
local autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup( {
	snippet = {
		expand = function( args )
			require( 'snippy' ).expand_snippet( args.body )
		end
	},
	mapping = cmp.mapping.preset.insert( {
		[ '<C-d>' ] = cmp.mapping.scroll_docs ( -4 ),
		[ '<C-f>' ] = cmp.mapping.scroll_docs( 4 ),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
    end, { "i", "s" }),
		[ '<C-Space>' ] = cmp.mapping.close(),
		[ '<CR>' ] = cmp.mapping.confirm( {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		} ),
	} ),
	sources = cmp.config.sources( {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'snippy'}
	} ),
	formatting = ( {
		format = lspkind.cmp_format( { mode = 'text', wirth_text = false, maxwidth = 50 } ),
	} ),
} )

cmp.setup.cmdline( '/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
} )

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
})

cmp.event:on(
	'confirm_done',
	autopairs.on_confirm_done()
)

vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.cmd[[
	highlight! default link CmpItemKind CmpItemMenuDefault
]]
