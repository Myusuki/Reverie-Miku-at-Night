vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require( "catppuccin" ).setup( {
	transparent_background = true,
	styles = {
		comments = { "italic" },
		functions = { "italic" },
	},
	integrations = {
		indent_blankline = { enabled = true, colored_indent_levels = false },
		gitsigns = true,
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
		lsp_saga = true,
		telescope = true,
		cmp = true
	},
} )

vim.cmd [[colorscheme catppuccin]]
