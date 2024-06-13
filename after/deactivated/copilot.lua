require('copilot').setup({
    panel = {
        enable = true,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            open = "<C-j><C-o>"
        }
    },
    suggestion = {
        enable = true,
        keymap = {
            accept = "<C-j><C-j>",
            next = "<C-j><C-l>",
            prev = "<C-j><C-h>",
            dismiss = "<C-j><C-q>",
        }
    }
})

require("CopilotChat").setup {
    debug = false,
}

vim.keymap.set('n', '<leader>jo', '<CMD>CopilotChatToggle<CR>', { desc = "Toggle Copilot Chat" })
vim.keymap.set({ 'n', 'v' }, '<leader>je', '<CMD>CopilotChatExplain<CR>', { desc = "Explain selected code" })
vim.keymap.set({ 'n', 'v' }, '<leader>jf', '<CMD>CopilotChatFix<CR>', { desc = "Fix selected code" })
vim.keymap.set({ 'n', 'v' }, '<leader>jd', '<CMD>CopilotChatDocs<CR>', { desc = "Add docs to selected code" })
vim.keymap.set({ 'n', 'v' }, '<leader>jt', '<CMD>CopilotChatTests<CR>', { desc = "Create tests for selected code" })
