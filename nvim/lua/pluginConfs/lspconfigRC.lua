local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
	return
end

local protocol = require('vim.lsp.protocol')

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	-- Keybindings
	local opts = { noremap=true, silent=true }
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	local mapkey = vim.keymap.set
	-- Diagnostics
	mapkey( 'n', '<space>lt', vim.diagnostic.goto_next, opts )
	mapkey( 'n', '<space>la', vim.diagnostic.goto_prev, opts )
	mapkey( 'n', '<space>lf', vim.diagnostic.open_float, opts )

	-- Function actions
	mapkey( 'n', '<space>lD', vim.lsp.buf.declaration, bufopts )
	mapkey( 'n', '<space>ld', vim.lsp.buf.definition, bufopts )
	mapkey( 'n', '<space>ls', vim.lsp.buf.signature_help, bufopts)

	-- Code actions
	mapkey( 'n', '<space>lh', vim.lsp.buf.hover, bufopts )
	mapkey( 'n', '<space>lc', vim.lsp.buf.code_action, bufopts )
	mapkey( 'n', '<space>lr', vim.lsp.buf.rename, bufopts )
end

local capabilities = require( 'cmp_nvim_lsp' ).default_capabilities( vim.lsp.protocol.make_client_capabilities() )



-- LSP configs
nvim_lsp.clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
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
