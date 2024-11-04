require('mini.icons').setup()
require('mini.extra').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.ai').setup()
require('mini.files').setup()
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
require('mini.pick').setup({

})

-- Keymaps
vim.keymap.set('n', '<leader>fe', '<CMD>:lua MiniFiles.open()<CR>', { desc = "Open file explorer" })
vim.keymap.set('n', '<leader>ff', '<CMD>:Pick files<CR>', { desc = "Open file finder" })
vim.keymap.set('n', '<leader>fb', '<CMD>:Pick buffers<CR>', { desc = "Open buffer finder" })
vim.keymap.set('n', '<leader>fF', '<CMD>:Pick grep_live<CR>', { desc = "Open buffer finder" })
vim.keymap.set('n', '<leader>ls', '<CMD>:Pick lsp scope="document_symbol"<CR>', { desc = "Show LSP symbols" })
vim.keymap.set('n', '<leader>li', '<CMD>:Pick lsp scope="implementation"<CR>', { desc = "Show LSP implementations" })
vim.keymap.set('n', '<leader>lr', '<CMD>:Pick lsp scope="references"<CR>', { desc = "Show LSP references" })
