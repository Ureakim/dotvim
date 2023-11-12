require('copilot').setup({
    panel = {
        enable = true,
        keymap = {
            open = "<C-j><C-j>"
        }
    },
    suggestion = {
        enable = true,
        keymap = {
            accept = "<C-j><C-k>",
            next = "<C-j><C-l>",
            prev = "<C-j><C-h>",
            dismiss = "<C-j><C-q>",
        }
    }
})
