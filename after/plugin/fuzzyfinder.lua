require("telescope").setup {
    pickers = {
        buffers = {
            sort_lastused = true,
            ignore_current_buffer = true
        }
    }
}

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "List symbol references" })
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, { desc = "List symbol implementations" })
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "List buffer symbols" })
vim.keymap.set('n', '<leader>fF', builtin.live_grep, { desc = "Find text in directory" })
