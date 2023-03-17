local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
	options = {
		icons_enabled = true,
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
