local status, cmp = pcall( require, "cmp" )
if ( not status ) then
	return
end
local lspkind = require 'lspkind'
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local snippy = require("snippy")

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
      elseif has_words_before() then
        cmp.complete()
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
		[ '<C-Space>' ] = cmp.mapping.complete(),
		[ '<C-CR>' ] = cmp.mapping.close(),
		[ '<CR>' ] = cmp.mapping.confirm( {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		} ),
	} ),
	sources = cmp.config.sources( {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	} ),
	formatting = ( {
		format = lspkind.cmp_format( { wirth_text = false, maxwidth = 50 } ),
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

vim.cmd[[
	set completeopt=menuone,noinsert,noselect
	highlight! default link CmpItemKind CmpItemMenuDefault
]]
