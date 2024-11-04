require("oil").setup()

vim.keymap.set('n', '<leader>fe', '<CMD>Oil<CR>', { desc = "Open parent directory" })
