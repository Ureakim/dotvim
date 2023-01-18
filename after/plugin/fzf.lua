vim.api.nvim_set_keymap('n', '<leader>ff',
	"<cmd>lua require('fzf-lua').files()<CR>",
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fb',
    "<cmd>lua require('fzf-lua').buffers()<CR>",
    { noremap = true, silent = true })
