vim.g.mapleader = " "               -- space as leader key

vim.keymap.set('i', '<C-l>', '<C-x><C-o>', { noremap = true })   -- autocomplete with ctrl + l

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)   -- Open Netrw file manager
vim.keymap.set('n', 'Q', "<nop>")   -- Leave me alone Ex mode !

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })  -- Disable insert mode in term with Escape

-- split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<C-w>', '<C-w>w', { noremap = true })

-- center cursor after half page motion
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
