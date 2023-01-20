-- require order is important
-- ex: lazy.nvim plugin need to have the mapleader already defined
require("ureakim.remaps")
require("ureakim.plugins")

vim.opt.filetype = "on"            -- activate filetype detection
vim.opt.filetype.plugin = "on"     -- activate filetype plugins
vim.opt.filetype.indent = "on"     -- activate filetype identation

vim.opt.autoread = true    -- autoreload file after external changes

vim.opt.backspace =  {"indent","eol","start"}   -- more powerful backspacing

vim.opt.completeopt = "menu,menuone,noinsert,noselect,preview"    -- configure autocomplete popup

vim.opt.hidden = true  -- hide unsaved buffer

vim.wo.wrap = false    -- no wrapping by default

-- vim.opt.timeout = true        -- activate mappings timeout
-- vim.opt.ttimeout = true       -- activate keycodes timeout
-- vim.opt.timeoutlen = 2000     -- mappings timeout in ms
-- vim.opt.ttimeoutlen = 500     -- keycodes timeout in ms

vim.opt.foldmethod = "syntax"   -- use syntax language for folding
vim.opt.foldlevelstart = 99     -- don't fold everything by default

vim.opt.syntax = "on"              -- activate syntax highlighting
vim.cmd.colorscheme("nebulae")     -- set the default colorscheme

vim.opt.splitbelow = true    -- make the new window appear below the current window
vim.opt.splitright = true    -- make the new window appear on the right

vim.opt.number = true            -- display line number
vim.opt.relativenumber = true    -- display relative number
vim.opt.ruler = true             -- display line and column in status bar
vim.opt.laststatus = 2           -- always display the status line
vim.opt.colorcolumn = "99"       -- add a ruler at column 99
vim.opt.showcmd = true           -- show the current command in the status line
vim.opt.cursorline = true        -- highlight the cursor line
vim.opt.scrolloff = 8            -- scroll offset
vim.opt.ttyfast = true           -- update terminal quickly
vim.opt.visualbell = true        -- screen flash instead of bell sound
vim.opt.termguicolors = true     -- use 24-bits colors

--
---- search
--

vim.opt.hlsearch = false          -- no highlight for search matches
vim.opt.incsearch = true          -- highlight search while typing
vim.opt.ignorecase = true         -- search is NOT case sensitive
vim.opt.smartcase = true          -- make search case sensitive if the pattern contains uppercase

--
---- encoding
--

vim.opt.encoding = "utf-8"                                        -- encoding display
vim.opt.fileencodings = {"utf-8", "cp1252", "default", "latin9"}  -- file encodings

--
---- indentation
--

vim.opt.tabstop = 2        -- how many <space> per <tab>
vim.opt.softtabstop = 2    -- how many <space> deleted when backspacing
vim.opt.shiftwidth = 2     -- how many <space> per indent command
vim.opt.expandtab = false  -- don't replace <tab> with <space> (because tab > space for indent)

--
---- netrw
--

vim.g.netrw_liststyle = 3      -- tree view by default
vim.g.netrw_browse_split = 4   -- open file in the previous windows
vim.g.netrw_winsize = 25       -- take 25% when open a split
