vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- [ Keymap ]
-- Yank Remap
vim.keymap.set({ 'n', 'v' }, '<leader>y', '\"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', '\"+Y', { desc = 'Yank line to system clipboard' })
vim.keymap.set('n', '<leader>yall', '<Cmd>%y+<CR>', { desc = '[Y]ank [A]ll' })
-- Don't yank replaced text
vim.keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', {})

-- [ Autocmds ]
local function augroup(name)
  return vim.api.nvim_create_augroup("reyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
