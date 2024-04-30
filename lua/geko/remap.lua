vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>tabprev<CR>")
vim.keymap.set("n", "<C-x>", "<cmd>tabclose<CR>")

vim.keymap.set("n", "Q", "<nop>")
