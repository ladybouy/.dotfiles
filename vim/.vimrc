syntax on
set autoindent 
set autoread
set cindent 
set cursorline
set encoding=utf-8 
set expandtab
set exrc
set ignorecase 
set hidden 
set incsearch 
set linebreak
set nobackup
set nocompatible 
set noerrorbells
set noswapfile
set number 
set path+=**
set relativenumber
set ruler
set scrolloff=8
set shiftwidth=4
set smartcase 
set softtabstop=4 
set tabstop=4
set wildmenu

" File browsing
let g:netwr_browse_split=4
let g:netwr_altv=1
let g:netrw_liststyle=3

" Plugins
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
	Plug 'arcticicestudio/nord-vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'ap/vim-css-color'
	Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

" Allows termguicolors
let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"

" Color scheme settings
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
set background=dark
colorscheme gruvbox-material

"highlight Normal ctermbg=NONE guibg=NONE
set termguicolors
