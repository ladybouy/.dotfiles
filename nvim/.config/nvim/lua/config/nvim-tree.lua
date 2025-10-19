-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'h',     api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', 'v',     api.node.open.vertical,                opts('Open: Vertical Split'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  view = {
      width = 40,
      side = "left",
      number = true,
      relativenumber = true,
  },
  renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = true,
      highlight_opened_files = "none",
      root_folder_modifier = ":~",
      indent_markers = {
          enable = false,
          icons = {
              corner = "└",
              edge = "│",
              item = "|",
              bottom = "-",
              none = "  ",
          }
      },
      icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
          },
          glyphs = {
              default = "",
              symlink = "",
              folder = {
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
                  symlink = "",
              },
              git = {
                  unstaged = "",
                  staged = "S",
                  unmerged = "",
                  renamed = "➜",
                  deleted = "",
                  untracked = "U",
                  ignored = "◌",
              },
          },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
}
