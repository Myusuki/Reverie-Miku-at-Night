
require( "catppuccin" ).setup( {
	transparent_background = false,
	term_colors = true,
	styles = {
		comments = { "italic" },
		functions = { "undercurl" },
		types = { "bold" },
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		cmp = true,
		lsp_saga = false,
		gitsigns = true,
		telescope = true,
		beacon = true,
	},
} )

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]
