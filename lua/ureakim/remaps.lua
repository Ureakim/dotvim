vim.g.mapleader = " "               -- space as leader key

vim.keymap.set('i', '<C-l>', '<C-x><C-o>', { noremap = true})   -- autocomplete with ctrl + l

vim.keymap.set('n', '<leader>se', vim.cmd.Ex)   -- autocomplete with ctrl + l

vim.keymap.set('n', '<C-e>', '<C-w>', { noremap = true})
