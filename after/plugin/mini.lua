require('mini.icons').setup()
require('mini.extra').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.ai').setup()
require('mini.files').setup()
local statusline = require('mini.statusline')
statusline.setup({
    content = {
        active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git           = statusline.section_git({ trunc_width = 40 })
            local diff          = statusline.section_diff({ trunc_width = 75 })
            local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = statusline.section_lsp({ trunc_width = 75 })
            local filename      = statusline.section_filename({ trunc_width = 140 })
            local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
            local location      = statusline.section_location({ trunc_width = 75 })
            local search        = statusline.section_searchcount({ trunc_width = 75 })

            return statusline.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { search, location } },
            })
        end,
        inactive = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git           = statusline.section_git({ trunc_width = 40 })
            local diff          = statusline.section_diff({ trunc_width = 75 })
            local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = statusline.section_lsp({ trunc_width = 75 })
            local filename      = statusline.section_filename({ trunc_width = 140 })
            local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
            local location      = statusline.section_location({ trunc_width = 75 })
            local search        = statusline.section_searchcount({ trunc_width = 75 })

            return statusline.combine_groups({
                { hl = 'MiniStatuslineDisabled', strings = { mode } },
                { hl = 'MiniStatuslineDisabled', strings = { git, diff, diagnostics, lsp } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineDisabled', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineDisabled', strings = { fileinfo } },
                { hl = 'MiniStatuslineDisabled', strings = { search, location } },
            })
        end,

    }
})
local animate = require('mini.animate')
animate.setup({
    cursor = {
        timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
    },
    scroll = {
        enable = false,
    },
    resize = {
        timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
    },
    open = {
        timing = animate.gen_timing.linear({ duration = 300, unit = 'total' }),
    },
    close = {
        timing = animate.gen_timing.linear({ duration = 300, unit = 'total' }),
    }
})
require('mini.hipatterns').setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'SpellBad' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]', group = 'SpellBad' },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]', group = 'SpellBad' },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'SpellCap' },
    }
})
require('mini.completion').setup({
    window = {
        info = { border = 'single' },
        signature = { border = 'single' },
    },
    mappings = {
        force_twostep = '<C-l>',
    },
})
require('mini.pick').setup({})

-- Keymaps
vim.keymap.set('n', '<leader>fe', '<CMD>:lua MiniFiles.open()<CR>', { desc = "Open file explorer" })
vim.keymap.set('n', '<leader>ff', '<CMD>:Pick files<CR>', { desc = "Open file finder" })
vim.keymap.set('n', '<leader>fb', '<CMD>:Pick buffers<CR>', { desc = "Open buffer finder" })
vim.keymap.set('n', '<leader>fF', '<CMD>:Pick grep_live<CR>', { desc = "Open buffer finder" })
