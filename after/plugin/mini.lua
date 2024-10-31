require('mini.icons').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.completion').setup({
    window = {
        info = { border = 'single' },
        signature = { border = 'single' },
    },
    mappings = {
        force_twostep = '<C-l>',
    },
})
