let s:color0 = [ '#0d1a26', 0 ]
let s:color1 = [ '#6494ae', 1 ]
let s:color2 = [ '#6daccd', 2 ]
let s:color3 = [ '#b99bb1', 3 ]
let s:color4 = [ '#a49bcc', 4 ]
let s:color5 = [ '#dab0d1', 5 ]
let s:color6 = [ '#9dd7de', 6 ]
let s:color7 = [ '#ebe1e7', 7 ]
let s:color8 = [ '#a49da1', 8]

let s:p 	       = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left    = [ [ s:color0, s:color6 ], [ s:color0, s:color6 ] ]
let s:p.normal.middle  = [ [ s:color7, s:color0 ] ]
let s:p.normal.right   = copy(s:p.normal.left)
let s:p.normal.error   = [ [ s:color7, s:color3 ] ]
let s:p.normal.warning = [ [ s:color7, s:color1 ] ]

let s:p.inactive.left   =  [ [ s:color7, s:color0 ], [ s:color7, s:color0 ] ]
let s:p.inactive.middle = copy(s:p.normal.middle)
let s:p.inactive.right  = copy(s:p.inactive.left)

let s:p.insert.left  = [ [ s:color0, s:color5 ], [ s:color0, s:color5 ] ]
let s:p.insert.right = copy(s:p.insert.left)

let s:p.replace.left  = [ [ s:color0, s:color4 ], [ s:color0, s:color4 ] ]
let s:p.replace.right = copy(s:p.replace.left)

let s:p.visual.left  = [ [ s:color0, s:color2 ], [ s:color0, s:color2 ] ]
let s:p.visual.right = copy(s:p.visual.left)

let s:p.tabline.left   = copy(s:p.normal.left)
let s:p.tabline.tabsel = copy(s:p.replace.right)
let s:p.tabline.middle = copy(s:p.normal.middle)
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#Miku#palette = lightline#colorscheme#flatten(s:p)
