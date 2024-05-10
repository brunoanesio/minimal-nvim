local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- buffer mappings
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Window resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Visual mappings
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Normal mappings
map("n", "J", "mzJ`z", opts)
-- paste remap
map("v", "<leader>p", '"_dp')
map("v", "<leader>P", '"_dP')
-- clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')
-- fast exit on insert
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
-- Save witch Ctrl-s
map("n", "<C-s>", "<CMD>w!<CR>", opts)
