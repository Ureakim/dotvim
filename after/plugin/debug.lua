local dap = require('dap')
local dapui = require("dapui")

require('dapui').setup({})

-- get all the bin available in a rust project
function _G.UreakimGetRustBins()
	local cargoResult = vim.fn.system("cargo run --bin")

	-- split result by lines
	local lines = {}
	for line in cargoResult:gmatch("[^\n]+") do
		table.insert(lines, line)
	end

	-- get only the bins and clean them
	local bins = {}
	for key, line in pairs(lines) do
		if key > 2 then
			local bin = string.gsub(line, "%s+", "")
			table.insert(bins, bin)
		end
	end

	return bins
end

-- convert the bin list in a completion string
function _G.UreakimGetRustBinsCompletion()
	local bins = _G.UreakimGetRustBins()
	return table.concat(bins, "\n")
end

local function getRustBins()
	local bins = _G.UreakimGetRustBins()

	if #bins == 1 then
		vim.fn.system("cargo build")
		return vim.fn.getcwd() .. '/target/debug/' .. bins[1]
	end

	local choice = vim.fn.input('Bin to debug > ', '', 'custom,v:lua.UreakimGetRustBinsCompletion')
	vim.fn.system("cargo build")
	return vim.fn.getcwd() .. '/target/debug/' .. choice
end

dap.adapters.codelldb = {
	type = 'server',
	port =  13000,
	executable = {
		command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
		args = {"--port", "13000"},
	}
}

dap.configurations.rust = {
	{
		name = 'Launch',
		type = 'codelldb',
		cwd = '${workspaceFolder}',
		request = 'launch',
		program = getRustBins,
		stopOnEntry = false,
		terminal = 'integrated',
		sourceLanguages = { 'rust' },
		showDisassembly = "never",
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
