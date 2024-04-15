return {
	'nvim-lualine/lualine.nvim',
	event = { "BufEnter" },
	config = function()
		local lualine = require( "lualine" )

		lualine.setup {
			options = {
				icons_enabled = false,
				theme = 'Miku',
				component_separators = '|',
				section_separators = { left = '', right = ''},
				disabled_filetypes = {},
				always_divide_middle = true,
				},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename'},
				lualine_x = {'progress'},
				lualine_y = {'encoding', 'fileformat', 'filetype'},
				lualine_z = {'location'},
				},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {'location'},
				lualine_y = {},
				lualine_z = {},
				},
			tabline = { lualine_a = {'tabs', 'filename'}, },
			extensions = {},
		}
	end,
}
