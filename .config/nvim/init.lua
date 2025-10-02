-- Setup globals
vim.g.mapleader = " "

-- Setup options
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Setup keymaps
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to pane below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to pane above' })

vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = 'Open explorer' })

-- Setup colorscheme
vim.cmd.colorscheme('habamax')
