vim.g.mapleader = " "      -- space as leader key
vim.g.maplocalleader = " " -- space as local leader key

vim.keymap.set('i', '<C-l>', '<C-x><C-o>', { noremap = true, desc = "autocomplete" })

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = "Open Netrw" })
vim.keymap.set('n', 'Q', "<nop>", { desc = "Leave me alone Ex mode" })

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, desc = "Disable insert mode in term with Escape" })

-- split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, desc = "Nav. ←" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, desc = "Nav. ↓" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, desc = "Nav. ↑" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, desc = "Nav. →" })
vim.keymap.set('n', '<C-w>', '<C-w>w', { noremap = true, desc = "Nav. ↻" })

-- center cursor after half page motion
vim.keymap.set('n', '<C-u>', '<C-u>zz', {desc = "Half ↑ and center cursor"})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {desc = "Half ↓ and center cursor"})
