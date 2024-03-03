local dap = require('dap')
local dapui = require("dapui")

--
-- Keymaps
--

vim.keymap.set('n', '<leader>dd', dap.continue, { desc = "Launch or continue" })
vim.keymap.set('n', '<leader>dc', dap.terminate, { desc = "Terminate" })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "Step in" })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = "Step out" })

--
-- DAP Config
--

require('dapui').setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

--
-- Rust
--

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
    port = 13000,
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "13000" },
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

--
-- Dotnet
--

dap.adapters.coreclr = {
    type = 'executable',
    command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    },
}

--
-- Golang
--

local function getGoProjectRoot()
    local gomod = vim.fn.system("go env GOMOD")
    local path = gomod:match("(.*[/\\])")
    local mainfile = path .. "main.go"
    return mainfile
end

dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = getGoProjectRoot,
        args = function()
            -- ask user for the arguments
            local args
            vim.ui.input({ prompt = "Arguments: " },
                function(str) args = str or "" end)
            return vim.split(args, " ")
        end
    },
    {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = getGoProjectRoot,
    },
    -- works with go.mod packages and sub packages
    -- {
    --  type = "delve",
    --  name = "Debug test (go.mod)",
    --  request = "launch",
    --  mode = "test",
    --  program = "./${relativeFileDirname}"
    -- }
}
