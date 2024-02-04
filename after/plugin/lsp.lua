-- LSP Config
vim.diagnostic.config({
    virtual_text = false -- deactivate virtual text
})

-- LSP Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>gg', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>gl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>lk', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

--
-- lsp servers
--

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
					ignore = {'W391'},
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
require('lspconfig')['gopls'].setup {}
