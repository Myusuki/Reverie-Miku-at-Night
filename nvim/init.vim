set clipboard=unnamed
set nu
set splitbelow splitright
set laststatus =2
set noshowmode
set wrap linebreak nolist
set showtabline =2
syntax on
set hlsearch 
set tabstop=4
set autoindent

" lead key 
let mapleader = "`"
map <leader>ps :PlugInstall<CR>

" vim plug plugins
call plug#begin('~/.vim/plugged')
" cosmetics
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
" tools
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
" autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-pyclang'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
call plug#end()

" lightline
let g:lightline = {
	\'colorscheme' : 'Miku',
	\'active': {
	\'left': [['mode','paste'],['readonly','filename','modified']],
	\'right': [['fileformat','fileencoding','filetype'],['percent'],['lineinfo']]
		\},
	\}
let g:lightline.enable = {
			\ 'statusline' : 1,
			\ 'tabline' : 1
			\}

" Indent Blankline
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_current_context_start = v:true

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer() " enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect
set shortmess+=c
" map InsertLeave autocmd to Esc key
inoremap <c-c> <Esc>
" Tab for selection
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" ncm2-pyclang
let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so.13'
let g:ncm2_pyclang#database_path = [
			\ 'compile_commands.json',
			\ 'build/compile_commands.json'
			\]
" ncm2-ultisnips
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')


" Ultisnippet 
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
