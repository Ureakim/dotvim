local fzf = require("fzf-lua")

vim.keymap.set('n', '<leader>ff', fzf.files, {})
vim.keymap.set('n', '<leader>fb', fzf.buffers, {})
vim.keymap.set('n', '<leader>lr', fzf.lsp_references, {})
vim.keymap.set('n', '<leader>li', fzf.lsp_implementations, {})
vim.keymap.set('n', '<leader>la', fzf.lsp_code_actions, {})

