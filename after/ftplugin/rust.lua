vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pt', ':terminal cargo test<cr>', { noremap = true, desc = "Launch Unit tests" })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pb', ':terminal cargo build<cr>', { noremap = true, desc = "Build" })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pc', ':terminal cargo check<cr>', { noremap = true, desc = "Check" })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pr', ':terminal cargo run<cr>', { noremap = true, desc = "Run" })
