require('copilot').setup({
    panel = {
        enable = true,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            open = "<C-b><C-o>",
            accept = "<CR>",
        }
    },
    suggestion = {
        enable = true,
        keymap = {
            accept = "<C-b><C-a>",
            next = "<C-b><C-b>",
            prev = "<C-b><C-g>",
            dismiss = "<ESC>",
        }
    }
})

require("CopilotChat").setup {
    debug = false,
}

vim.keymap.set('n', '<leader>bc', '<CMD>CopilotChatToggle<CR>', { desc = "Toggle Copilot Chat" })
vim.keymap.set({ 'n', 'v' }, '<leader>be', '<CMD>CopilotChatExplain<CR>', { desc = "Explain selected code" })
vim.keymap.set({ 'n', 'v' }, '<leader>bf', '<CMD>CopilotChatFix<CR>', { desc = "Fix selected code" })
vim.keymap.set({ 'n', 'v' }, '<leader>bd', '<CMD>CopilotChatDocs<CR>', { desc = "Add docs to selected code" })
vim.keymap.set({ 'n', 'v' }, '<leader>bt', '<CMD>CopilotChatTests<CR>', { desc = "Create tests for selected code" })

