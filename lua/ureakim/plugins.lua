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
	{"nvim-lualine/lualine.nvim"},

	{"nvim-treesitter/nvim-treesitter", init = TSUpdate},

	{"nvim-telescope/telescope.nvim", tag = "0.1.0",
	dependencies = {"nvim-lua/plenary.nvim"}},

	{"neovim/nvim-lspconfig"},

	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
})