local mappings = require("snippy.mapping")
vim.keymap.set('i', '<Tab>', mappings.expand_or_advance('<Tab>'))
