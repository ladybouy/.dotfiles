
vim.opt.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_transparent_background = 1
--vim.g.gruvbox_material_enable_bold = 1;
-- vim.g.airline_theme = "gruvbox_material"
-- vim.g.airline_theme = "material"
-- vim.g.material_theme_style = "ocean"
--
--
-- local colorscheme = "material"
local colorscheme = "gruvbox-material"
-- local colorscheme = "catppuccin-mocha"
--local colorscheme = "gruvbox"
--
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
