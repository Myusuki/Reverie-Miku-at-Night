local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
	return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
end

local capabilities = require( 'cmp_nvim_lsp' ).default_capabilities( vim.lsp.protocol.make_client_capabilities() )

nvim_lsp.clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
}

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- recognize the vim global
				globals = { 'vim', 'on_attach' }
			},
			workspace = {
				-- make lsp aware of nvim runtime files
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	},
	capabilities = capabilities,
}
