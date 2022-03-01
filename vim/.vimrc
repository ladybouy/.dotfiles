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
set path+=.,,**
set scrolloff=8
set shiftwidth=4
set smartcase 
set smartindent
set softtabstop=4 
"set splitbelow
set splitright
set switchbuf=usetab,newtab
set tabstop=4
set wildchar=<Tab>
set wildmenu
set wildmode=full

"------- Mappings
let mapleader = " "

" behave vim
nnoremap Y y$

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Stay in ident mode
vnoremap > >gv
vnoremap < <gv

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
noremap <leader>k :m .-2<CR>==
noremap <leader>j :m .+1<CR>==

" Resize windows with arrows keys
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>

" Buffer management
nnoremap <silent> B :buffers<CR>:buffer<Space>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <C-p> :bp<CR>

" Tab management
" TODO

"------- File browsing
nnoremap <leader>e Lex 30<CR>
let g:netwr_browse_split=4
let g:netwr_altv=1
let g:netrw_liststyle=3

"------- Plugins
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
	Plug 'arcticicestudio/nord-vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'ap/vim-css-color'
	Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

"------- Allows termguicolors
let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"

"------- Color scheme settings
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
set background=dark
colorscheme gruvbox-material

"highlight Normal ctermbg=NONE guibg=NONE
set termguicolors
