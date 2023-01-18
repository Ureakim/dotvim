vim.api.nvim_set_keymap('n', '<leader>ff',
	"<cmd>lua require('fzf-lua').files()<CR>",
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fb',
    "<cmd>lua require('fzf-lua').buffers()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>la',
    "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>lr',
    "<cmd>lua require('fzf-lua').lsp_references()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>li',
    "<cmd>lua require('fzf-lua').lsp_implementations()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>lD',
    "<cmd>lua require('fzf-lua').lsp_declarations()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gl',
    "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gL',
    "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>",
    { noremap = true, silent = true })
