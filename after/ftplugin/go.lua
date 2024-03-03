vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pt', ':terminal go test ./...<cr>', { noremap = true, desc = "Launch Unit tests" })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pb', ':terminal go build<cr>', { noremap = true, desc = "Build" })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pr', ':terminal go run .<cr>', { noremap = true, desc = "Run" })
