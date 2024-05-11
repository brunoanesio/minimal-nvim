local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>qq", "<CMD>mksession!<CR> || <CMD>q!<CR>", opts)

-- buffer mappings
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
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

-- Plugin Keymaps
map("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", opts)
map("n", "<leader>qs", "<CMD>lua MiniSessions.read()<CR>", opts)
map("n", "<leader>ff", "<CMD>Pick files<CR>", opts)
map("n", "<leader>fg", "<CMD>Pick grep_live<CR>", opts)
map("n", "<leader>bb", "<CMD>Pick buffers<CR>", opts)

-- LSP Keymaps
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
