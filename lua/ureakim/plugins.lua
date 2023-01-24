local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{"nvim-treesitter/nvim-treesitter", init = TSUpdate},
	{"neovim/nvim-lspconfig"},
	{"alexghergh/nvim-tmux-navigation"},

	{"j-hui/fidget.nvim"},
	{"nvim-lualine/lualine.nvim"},

	{"dcampos/nvim-snippy"},

	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"nvim-telescope/telescope.nvim", tag = "0.1.1",
	dependencies = { "nvim-lua/plenary.nvim" }},
})
