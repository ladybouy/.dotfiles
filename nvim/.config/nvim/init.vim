syntax on
set autoread
set cindent 
set cursorline
set encoding=utf-8
set exrc
set expandtab 
set ignorecase 
set incsearch 
set hidden
set noerrorbells 
set noswapfile 
set number
set path+=**
set relativenumber
set ruler
set scrolloff=10
set shiftwidth=4
set smartindent
set tabstop=4
set wildmenu

"============== Plugins =============== 
call plug#begin('~/.config/nvim/plugged')
"Themes 
	Plug 'morhetz/gruvbox'			 "gruvbox
    Plug 'sainnhe/gruvbox-material'  "gruvbox-material
    Plug 'arcticicestudio/nord-vim'  "nord
    Plug 'sainnhe/everforest'
"Functionality
    Plug 'tpope/vim-surround'        
    Plug 'vim-airline/vim-airline' 
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'ap/vim-css-color' 
call plug#end() 

"Gruvbox settings 
"let g:gruvbox_contrast_dark='hard'
"let g:airline_theme='gruvbox'
"set background=dark
"colorscheme gruvbox
"highlight Normal ctermbg=NONE guibg=NONE   "transparency

"Gruvbox-material settings
if has('termguicolors')
    set termguicolors
endif
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
let g:airline_theme='gruvbox_material'
set background=dark
colorscheme gruvbox-material


"Tree Sitter setup 
lua << EOF
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
   ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "julia",
      "latex",
      "python"
  }
}
EOF

" Fixes tab issue with julia files
let g:latex_to_unicode_tab = "off"

" NeoVim LSP setup
lua << EOF
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
end
EOF

lua << EOF
require'lspconfig'.julials.setup{
    on_new_config = function(new_config,new_root_dir)
      server_path = "/home/jeffrey/.julia/packages/LanguageServer/jiDTR/src"
      cmd = {
        "julia",
        "--project="..server_path,
        "--startup-file=no",
        "--history-file=no",
        "-e", [[
          using Pkg;
          Pkg.instantiate()
          using LanguageServer; using SymbolServer;
          depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
          project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
          # Make sure that we only load packages from this environment specifically.
          @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
          server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
          server.runlinter = true;
          run(server);
      ]]
    };
      new_config.cmd = cmd
    end
}
EOF

"LSP config (the mappings used the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Compe setup (Autocompletion)
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
