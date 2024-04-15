return {
	'neovim/nvim-lspconfig',
	event = BufEnter,
	config = function()
		local nvim_lsp = require( 'lspconfig' )
		local protocol = require('vim.lsp.protocol')

		local on_attach = function(client, bufnr)
			-- Keybindings
			local mapkey = vim.keymap.set
			-- Diagnostics
			mapkey( 'n', '<leader>lt', vim.diagnostic.goto_next, { noremap=true, silent=true, desc = "next diagnostic" } )
			mapkey( 'n', '<leader>la', vim.diagnostic.goto_prev, { noremap=true, silent=true, desc = "previous diagnostic" } )
			mapkey( 'n', '<leader>lf', vim.diagnostic.open_float, { noremap=true, silent=true, desc = "show in floating window" } )

			-- Function actions
			mapkey( 'n', '<leader>lD', vim.lsp.buf.declaration, { noremap=true, silent=true, buffer=bufnr, desc = "jump to declaration" } )
			mapkey( 'n', '<leader>ld', vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr, desc = "jump to definition" } )
			mapkey( 'n', '<leader>ls', vim.lsp.buf.signature_help, { noremap=true, silent=true, buffer=bufnr, desc = "show signature in floating window" })

			-- Code actions
			mapkey( 'n', '<leader>lh', vim.lsp.buf.hover, { noremap=true, silent=true, buffer=bufnr, desc = "show hover info in floating window" } )
			mapkey( 'n', '<leader>lc', vim.lsp.buf.code_action, { noremap=true, silent=true, buffer=bufnr, desc = "perform code action" } )
			mapkey( 'n', '<leader>lr', vim.lsp.buf.rename, { noremap=true, silent=true, buffer=bufnr, desc = "rename all references" } )
		end

		local capabilities = require( 'cmp_nvim_lsp' ).default_capabilities( vim.lsp.protocol.make_client_capabilities() )

		vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

		local border = {
			{"🭽", "FloatBorder"},
			{"▔", "FloatBorder"},
			{"🭾", "FloatBorder"},
			{"▕", "FloatBorder"},
			{"🭿", "FloatBorder"},
			{"▁", "FloatBorder"},
			{"🭼", "FloatBorder"},
			{"▏", "FloatBorder"},
		}
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		  opts = opts or {}
		  opts.border = opts.border or border
		  return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		-- LSP configs
		nvim_lsp.clangd.setup {
			root_dir=nvim_lsp.util.root_pattern( '.clangd' ),
			cmd = { "clangd" },
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			vim.diagnostic.config({ virtual_text = false }),
		}

		nvim_lsp.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities;
			settings =
			{
				Lua =
				{
					runtime =
					{
						version = 'LuaJIT',
					},
					diagnostics =
					{
						globals = { 'vim' },
					},
					workspace =
					{
						library = vim.api.nvim_get_runtime_file( "", true ),
					},
					telemetry =
					{
						enable = false,
					},
				},
			},
		}

		nvim_lsp.ltex.setup {
			filetypes = { "tex" },
			on_attach = on_attach,
			capabilities = capabilities,
		}

		nvim_lsp.jdtls.setup {
			cmd = { 'jdtls' },
			filetypes = { "java", "class", "jad", "jar", "jsp" },
			on_attach = on_attach;
			capabilities = capabilities;
		}

		nvim_lsp.omnisharp.setup {
			cmd = { "dotnet", "/home/myu/.local/share/nvim/mason/packages/omnisharp/OmniSharp.Roslyn.dll"},
			filetypes = { "cs", "vb" },
			on_attach = on_attach,
			capabilities = capabilities,
		}
		nvim_lsp.asm_lsp.setup {
			cmd = { "asm-lsp" },
			filetypes = { "asm", "vmasm" },
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
}
