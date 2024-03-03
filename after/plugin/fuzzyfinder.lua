local fzf = require("fzf-lua")

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = "Find file" })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "Find buffer" })
vim.keymap.set('n', '<leader>lr', fzf.lsp_references, { desc = "List symbol references" })
vim.keymap.set('n', '<leader>li', fzf.lsp_implementations, { desc = "List symbol implementations" })
vim.keymap.set('n', '<leader>la', fzf.lsp_code_actions, { desc = "List code actions" })
vim.keymap.set('n', '<leader>ls', fzf.lsp_document_symbols, { desc = "List buffer symbols" })
vim.keymap.set('n', '<leader>fF', fzf.grep, { desc = "Find text in directory" })

