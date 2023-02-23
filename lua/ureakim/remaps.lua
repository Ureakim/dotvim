vim.g.mapleader = " "               -- space as leader key

vim.keymap.set('i', '<C-l>', '<C-x><C-o>', { noremap = true})   -- autocomplete with ctrl + l

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)   -- autocomplete with ctrl + l

vim.keymap.set('n', 'Q', "<nop>")   -- Leave me alone Ex mode !

-- center cursor after half page motion
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
