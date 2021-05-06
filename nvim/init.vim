set clipboard=unnamed
set nu
set splitbelow splitright
set laststatus =2
set noshowmode

let g:lightline = {
	\'colorscheme' : 'Miku',
	\'active': {
	\'left': [['mode','paste'],['readonly','filename','modified']],
	\'right': [['fileformat','fileencoding','filetype'],['percent'],['lineinfo']]
		\},
	\}

let mapleader = "`"
map <leader>ps :PlugInstall<CR>
map <leader>wc :VimwikiAll2HTML<CR>

call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
call plug#end()
