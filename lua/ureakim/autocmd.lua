local group = vim.api.nvim_create_augroup("UreakimAugroup", {clear = true})

-- close preview split after completion
vim.api.nvim_create_autocmd("InsertLeave,CompleteDone", {
	callback = function()
		if vim.fn.pumvisible() == 0 then
			vim.cmd("pclose")
		end
	end,
	group = group,
})
