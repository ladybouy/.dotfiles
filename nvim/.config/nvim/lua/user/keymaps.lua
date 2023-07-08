
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- File Explorer
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Behave vim
keymap("n", "Y", "y$", opts)

-- Buffer management
keymap("n", "<C-b>", ":buffers<CR>:buffer<Space>",opts)
keymap("n", "<C-p>", ":bp<CR>",opts)
keymap("n", "<C-n>", ":bn<CR>",opts)

-- Window movement
keymap("i", "<A-h>",  "<C-\\><C-N><C-w>h", opts)
keymap("i", "<A-j>",  "<C-\\><C-N><C-w>j", opts)
keymap("i", "<A-k>",  "<C-\\><C-N><C-w>k", opts)
keymap("i", "<A-l>",  "<C-\\><C-N><C-w>l", opts)

keymap("n", "<A-h>",  "<C-\\><C-N><C-w>h", opts)
keymap("n", "<A-j>",  "<C-\\><C-N><C-w>j", opts)
keymap("n", "<A-k>",  "<C-\\><C-N><C-w>k", opts)
keymap("n", "<A-l>",  "<C-\\><C-N><C-w>l", opts)

keymap("t", "<A-h>",  "<C-\\><C-N><C-w>h", opts)
keymap("t", "<A-j>",  "<C-\\><C-N><C-w>j", opts)
keymap("t", "<A-k>",  "<C-\\><C-N><C-w>k", opts)
keymap("t", "<A-l>",  "<C-\\><C-N><C-w>l", opts)


-- Resize windows with arrow keys
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("i", "C-j", "<esc>:m .+1<CR>==", opts)
keymap("i", "C-k", "<esc>:m .-2<CR>==", opts)
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)


-- Terminal
keymap("t", "<esc>", "<C-\\><C-n>", opts)
vim.cmd[[let g:floaterm_keymap_toggle = '<leader>t']]
vim.cmd[[let g:floaterm_wintype = 'split']]
vim.cmd[[let g:floaterm_height = 20]]

--nvim-tree toggle
keymap("n","<leader>e", ":NvimTreeToggle<cr>", opts)
