-- LSP Config
vim.diagnostic.config({
    virtual_text = false -- deactivate virtual text
})

-- LSP Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Prev error" })
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Next error" })
vim.keymap.set('n', '<leader>gg', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "View diagnostics" })
vim.keymap.set('n', '<leader>gl', vim.diagnostic.setloclist,
    { noremap = true, silent = true, desc = "View diagnostics in loclist" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf = bufnr})

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
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = "List code actions" })
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

--
-- lsp servers
--
--

-- CSS
require('lspconfig')['cssls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- HTML
require('lspconfig')['html'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Rust
require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    ['rust-analyzer'] = {
        diagnostics = {
            enable = false,
        }
    }
}

-- LUA
require('lspconfig')['lua_ls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            -- Version of Lua used
            runtime = { version = 'LuaJIT' },
            -- Get the language server to recognize the `vim` global
            diagnostics = { globals = { 'vim' } },
            -- Make the server aware of Neovim runtime files
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
        },
    }
}

-- Python
require('lspconfig')['pylsp'].setup {
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
    on_attach = on_attach,
    flags = lsp_flags,
}

-- C/C++
require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- C#
require('lspconfig')['omnisharp'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { vim.fn.expand('$HOME/.local/share/nvim/mason/bin/omnisharp') },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = true,
    enable_import_completion = false,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
}

-- Golang
require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['templ'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Zig
require 'lspconfig'.zls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Godot
require 'lspconfig'.gdscript.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Js/Ts
require 'lspconfig'.ts_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
