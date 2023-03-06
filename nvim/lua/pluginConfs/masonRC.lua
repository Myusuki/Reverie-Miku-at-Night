require( "mason" ).setup( {
	pip = { upgrade_pip = false },
	ui = { check_outdated_packages_on_open = true,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
	},
} )
require( "mason-lspconfig" ).setup( {
	ensure_installed = { "lua_ls", "clangd" },
	automatic_installation = true;
} )
