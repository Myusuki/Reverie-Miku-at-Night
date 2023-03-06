vim.cmd( "autocmd!" )
-- backspace
vim.opt.backspace = { 'start', 'eol', 'indent' }
-- backup
vim.opt.backup = false
-- clipboard
vim.o.clipboard = 'unnamedplus'
-- cmd height
vim.opt.cmdheight = 1
-- file encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
-- file title
vim.opt.title = true
-- highlighting
vim.opt.background = 'dark'
vim.opt.cursorline = true
vim.o.hlsearch = true
vim.bo.syntax = 'ON'
vim.opt.termguicolors = false
vim.opt.wildoptions = 'pum'
-- inccommand
vim.opt.inccommand = 'split'
-- indentation 
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.bo.expandtab = false
vim.opt.smartindent = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
-- laststatus 
vim.opt.laststatus = 1
-- numbered lines
vim.wo.number = true
-- pathfinding
vim.opt.path:append { '**' }
-- show cmd
vim.opt.showcmd = true
-- show tabline
vim.o.showtabline = 2
-- split windows to the right
vim.o.splitright = true
-- softwrap
vim.wo.wrap = true
-- syntax highlighting
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
