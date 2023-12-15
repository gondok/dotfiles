-- Define common option
local opts = {
	noremap = true,
	silent = true,
}

vim.g.mapleader = " "

-- NORMAL MODE --

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Split window
vim.keymap.set("n", "<C-w>h", "<C-w>s", opts)
vim.keymap.set("n", "<C-w>c", ":close<CR>", opts)

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize window with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Rigth>", ":vertical resize +2<CR>", opts)

-- VISUAL MODE --

-- Identation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- INSERT MODE --
vim.keymap.set("i", "jk", "<Esc>", opts)

-- VISUAL MODE --
vim.keymap.set("v", "jq", "<Esc>", opts)
