vim.g.rust_recommended_style = false   -- do not use the default formatting style

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pt', ':terminal cargo test<cr>', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pb', ':terminal cargo build<cr>', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pc', ':terminal cargo check<cr>', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pr', ':terminal cargo run<cr>', { noremap = true })
