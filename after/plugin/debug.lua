local dap = require('dap')
require('dapui').setup({})

-- cargo run --package
function _G.getRustPackages()
	return 'test\ntest2\ntest3\ntrust'
end

local cwd = vim.fn.getcwd() .. '/target/debug/'

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
		program = function()
			return vim.fn.input({
				prompt = 'Path to executable: ',
		--		default = cwd,
				completion = "custom,v:lua.getRustPackages",
			})
		end,
		stopOnEntry = false,
		terminal = 'integrated',
		sourceLanguages = { 'rust' },
		showDisassembly = "never",
	},
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
