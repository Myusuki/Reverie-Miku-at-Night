local colors = {
	color0 = '#0d1a26',
	color1 = '#6494ae',
	color2 = '#6daccd',
	color3 = '#b99bb1',
	color4 = '#a49bcc',
	color5 = '#dab0d1',
	color6 = '#9dd7de',
	color7 = '#ebe1e7',
	color8 = '#a49da1',
}

return {
  normal = {
    a = { fg = colors.color0, bg = colors.color6, gui = 'bold' },
    b = { fg = colors.color7, bg = colors.color0 },
    c = { fg = colors.color7, bg = colors.color0 },
  },
  insert = { a = { fg = colors.color0, bg = colors.color5, gui = 'bold' } },
  visual = { a = { fg = colors.color0, bg = colors.color2, gui = 'bold' } },
  replace = { a = { fg = colors.color0, bg = colors.color4, gui = 'bold' } },
  inactive = {
    a = { fg = colors.color7, bg = colors.color0, gui = 'bold' },
    b = { fg = colors.color7, bg = colors.color0 },
    c = { fg = colors.color7, bg = colors.color0 },
  },
	tabline = { a = { fg = colors.color0, bg = colors.color2, gui = 'bold' }	},
}
