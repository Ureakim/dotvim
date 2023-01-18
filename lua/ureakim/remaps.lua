vim.g.mapleader = " "               -- space as leader key

vim.keymap.set('i', '<C-l>', '<C-x><C-o>', { noremap = true})   -- autocomplete with ctrl + l

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)   -- autocomplete with ctrl + l

-- splits
vim.keymap.set('n', '<leader>sh', '<C-w>h', { noremap = true})
vim.keymap.set('n', '<leader>sj', '<C-w>j', { noremap = true})
vim.keymap.set('n', '<leader>sk', '<C-w>k', { noremap = true})
vim.keymap.set('n', '<leader>sl', '<C-w>l', { noremap = true})
