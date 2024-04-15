return {
	'hrsh7th/nvim-cmp',
	dependencies = { 'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-path',
		-- 'dcampos/nvim-snippy',
		-- 'dcampos/cmp-snippy',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'octaltree/cmp-look',
		'hrsh7th/cmp-nvim-lua' },
	event = InsertEnter,
	config = function()
		local cmp = require( 'cmp' )
		local lspkind = require ( 'lspkind' )
		-- local snippy = require( "snippy" )
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_snipmate").lazy_load()
		local autopairs = require('nvim-autopairs.completion.cmp')
		local has_words_before = function()
		  unpack = unpack or table.unpack
		  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup( {
			snippet = {
				expand = function( args )
					-- require( 'snippy' ).expand_snippet( args.body )
					require('luasnip').lsp_expand(args.body)
				end
			},
			mapping = cmp.mapping.preset.insert( {
				[ '<C-t>' ] = cmp.mapping.scroll_docs ( -4 ),
				[ '<C-h>' ] = cmp.mapping.scroll_docs( 4 ),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				[ '<C-Enter>' ] = cmp.mapping( function(fallback)
					if cmp.visible() then
						cmp.close()
					else
						fallback()
					end
				end, {'i', 'c'} ),
				[ '<CR>' ] = cmp.mapping.confirm( {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				} ),
			} ),
			sources = cmp.config.sources( {
				{ name = 'nvim_lsp', function (entry, ctx)
					if entry:get_kind() == 15 or entry:get_kind() == 1 then
						return false
					end
					return true
				end, priority = 1000 },
				{ name = 'luasnip', priority = 750 },
				{ name = 'nvim_lua', priority = 3 },
				{ name = 'path', get_cwd = io.popen( "cd" ):read(), priority = 2 },
				{ name = 'buffer', keyword_length = 5, max_item_count = 5 },
			} ),
			sorting = {
				comparators = {
					cmp.config.compare.order,
					cmp.config.compare.exact,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.offset,
				},
			},
			formatting = ( {
					format = lspkind.cmp_format( { mode = 'text', wirth_text = false, maxwidth = 50,
						menu = {
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							luasnip = "[LuaSnip]",
							look = "[Look]",
							path = "[Path]",
							}
						} )
			} ),
			window = {
				documentation = cmp.config.window.bordered(),
			},
		} )

		cmp.setup.filetype('txt', {
			sources = cmp.config.sources( {
				{ name = 'buffer' },
				{ name = 'look' },
				{ name = 'path' },
			} )
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
	end,
}
