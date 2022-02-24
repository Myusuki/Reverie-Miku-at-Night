local colors = {
  black   = '#000000',
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
    a = { fg = colors.black, bg = colors.color6, gui = 'bold' },
    b = { fg = colors.color7, bg = colors.black },
    c = { fg = colors.color7, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.color5, gui = 'bold' } },
  visual = { a = { fg = colors.black, bg = colors.color2, gui = 'bold' } },
  replace = { a = { fg = colors.black, bg = colors.color4, gui = 'bold' } },
  inactive = {
    a = { fg = colors.color7, bg = colors.black, gui = 'bold' },
    b = { fg = colors.color7, bg = colors.black },
    c = { fg = colors.color7, bg = colors.black },
  },
	tabline = { a = { fg = colors.black, bg = colors.color2, gui = 'bold' }	},
}
