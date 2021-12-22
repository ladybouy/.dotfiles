
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenver you save the plugins.lua file
vim.cmd[[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    },
}

-- Plugins
return packer.startup(function(use)
    
    -- Have packer manage itself
    use "wbthomason/packer.nvim"

    -- Color Schemes 
	use "morhetz/gruvbox"
    use "sainnhe/gruvbox-material"
    use "arcticicestudio/nord-vim"
	use "tomasiser/vim-code-dark"
    use "lunarvim/darkplus.nvim"
    use "folke/tokyonight.nvim"
    use "sainnhe/sonokai"
    use "vim-airline/vim-airline" 
 
    -- Completion plugins
    use "hrsh7th/nvim-cmp"              -- The completion plugin
    use "hrsh7th/cmp-buffer"            -- Buffer completions
    use "hrsh7th/cmp-path"              -- Path Completions
    use "hrsh7th/cmp-cmdline"           -- Commandline completions
    use "saadparwaiz1/cmp_luasnip"      -- Snippet completions
    use "hrsh7th/cmp-nvim-lsp"          
    use "hrsh7th/cmp-nvim-lua"          

    -- Snippets
    use "L3MON4D3/LuaSnip"              -- Snippet engine
    use "rafamadriz/friendly-snippets"  -- Collections of snippets

    -- Functionality
    use "tpope/vim-surround"
    use "nvim-lua/popup.nvim"           -- Pop up API from vim
    use "nvim-lua/plenary.nvim"         -- Useful lua functions

    -- LSP 
    use "neovim/nvim-lsp"
    use "williamboman/nvim-lsp-installer"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOSTRAP then
        require("packer").sync()
    end
end)
