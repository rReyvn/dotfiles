-- File Browser
vim.keymap.set("n", "-", ":Explore<CR>", { desc = "File Browser", silent = true })

-- Yank Remap
vim.keymap.set("n", "<leader>yall", ":%y+<CR>", { desc = "[Y]ank [A]ll" })
-- vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Don't yank replaced text
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })

-- Always center scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move line
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- Buffer Movement
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>", { desc = "Go to next buffer", silent = true })
vim.keymap.set("n", "<leader><S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer", silent = true })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer", silent = true })
vim.keymap.set("n", "<leader>bw", ":bwipeout<CR>", { desc = "Wipeout buffer", silent = true })
