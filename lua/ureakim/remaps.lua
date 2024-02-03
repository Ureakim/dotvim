vim.g.mapleader = " "               -- space as leader key

vim.keymap.set('i', '<C-l>', '<C-x><C-o>', { noremap = true })   -- autocomplete with ctrl + l

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)   -- Open Netrw file manager
vim.keymap.set('n', 'Q', "<nop>")   -- Leave me alone Ex mode !

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })  -- Disable insert mode in term with Escape

-- center cursor after half page motion
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
