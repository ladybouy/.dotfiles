
local options = {
    autoread = true,
    backup = false,
    cindent = true,
    cursorline = true,
    errorbells = false,
    exrc = true,
    expandtab = true,
    fileencoding = "utf-8",
    incsearch = true,
    hidden = true,
    linebreak = true,
    number = true,
    relativenumber = true,
    ruler = true,
    scrolloff = 8,
    shiftwidth = 4,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    wildmenu = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.path:append "**"
vim.opt.iskeyword:append "-"
