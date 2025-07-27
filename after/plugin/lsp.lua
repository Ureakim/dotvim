-- LSP Config
vim.diagnostic.config({
    virtual_text = false -- deactivate virtual text
})

-- LSP Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[g', function() vim.diagnostic.jump({count=1, float=true}) end, { noremap = true, silent = true, desc = "Prev error" })
vim.keymap.set('n', ']g', function() vim.diagnostic.jump({count=1, float=true}) end, { noremap = true, silent = true, desc = "Next error" })
vim.keymap.set('n', '<leader>gg', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "View diagnostics" })
vim.keymap.set('n', '<leader>gl', vim.diagnostic.setloclist,
    { noremap = true, silent = true, desc = "View diagnostics in loclist" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition,
        { noremap = true, silent = true, buffer = bufnr, desc = "Definition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true, buffer = bufnr, desc = "Hover infos" })
    vim.keymap.set('n', '<leader>lk', vim.lsp.buf.signature_help,
        { noremap = true, silent = true, buffer = bufnr, desc = "Signature" })
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition,
        { noremap = true, silent = true, buffer = bufnr, desc = "Type definition" })
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end,
        { noremap = true, silent = true, buffer = bufnr, desc = "Format buffer" })
    vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename,
        { noremap = true, silent = true, buffer = bufnr, desc = "Rename symbol" })
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,
        { noremap = true, silent = true, buffer = bufnr, desc = "List code actions" })
    vim.keymap.set('n', '<leader>ls', '<CMD>:Pick lsp scope="document_symbol"<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Show LSP symbols" })
    vim.keymap.set('n', '<leader>li', '<CMD>:Pick lsp scope="implementation"<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Show LSP implementations" })
    vim.keymap.set('n', '<leader>lr', '<CMD>:Pick lsp scope="references"<CR>',
        { noremap = true, silent = true, buffer = bufnr, desc = "Show LSP references" })
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local function createLspConfig(name, config)
    if config == nil then
        config = {}
    end

    config["on_attach"] = on_attach
    config["flags"] = lsp_flags
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end

--
-- lsp servers
--

createLspConfig('html')
createLspConfig('cssls')
createLspConfig('gopls')
createLspConfig('templ')
createLspConfig('ts_ls')
createLspConfig('csharp_ls')
createLspConfig('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                }
            }
        }
    },
})
createLspConfig('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library'
                    -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})

