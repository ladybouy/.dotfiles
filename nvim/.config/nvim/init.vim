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
set linebreak
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

"############## Plugins ############### 
call plug#begin('~/.config/nvim/plugged')
"Themes 
	Plug 'morhetz/gruvbox'           "gruvbox
    Plug 'sainnhe/gruvbox-material'  "gruvbox-material
    Plug 'arcticicestudio/nord-vim'  "nord
"Functionality
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline' 
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'ap/vim-css-color'
"Snippts
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
"Completions 
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'    
call plug#end() 


"######### Color scheme settings #########
if has('termguicolors')
    set termguicolors
endif
" Gruvbox-material
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_bold = 1
let g:airline_theme='gruvbox_material'
set background=dark
colorscheme gruvbox-material


"########## Tree Sitter setup #########
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


"######### NeoVim LSP setup #########
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

"######### Auto Completion ##########
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer', keyword_length = 5 },
    })
  })

  -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
EOF
