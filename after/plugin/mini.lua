require('mini.icons').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.comment').setup()
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
