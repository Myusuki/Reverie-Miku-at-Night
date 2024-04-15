return {
	'luukvbaal/nnn.nvim',
	lazy = false,
	priority = 1001,
	config = function()
		local nnn = require("nnn")
		local builtin = require("nnn").builtin

		nnn.setup({
				explorer = {
					cmd = "nnn -G",
					width = "40",
					side = "topleft",
					tabs = true,
					fullscreen = true,
				},
				picker = {
					cmd = "nnn",
					fullscreen = false,
				},
				mappings = {
					{ "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
					{ "<C-s>", builtin.open_in_split },     -- open file(s) in split
					{ "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
					{ "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
					{ "<C-e>", builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
				},
				auto_open = {
					ft_ignore = { "gitcommit", }
				},
				replace_netrw = "picker",
				quitcd = "cd"
			})
	end,
}
