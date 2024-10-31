local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Requirements
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "echasnovski/mini.nvim",            version = false },

    -- Theme & UI
    {
        "Ureakim/nebulae.nvim",
        lazy = false,
        priority = 1000
    },
    { "nvim-lualine/lualine.nvim" },
    { "aserowy/tmux.nvim" },
    { "nvim-telescope/telescope.nvim",          branch = "0.1.x" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    },

    -- Autocomplete
    { "neovim/nvim-lspconfig" },
    { "dcampos/nvim-snippy" },

    -- debug
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",           dependencies = { "nvim-neotest/nvim-nio" } },
    { "zbirenbaum/copilot.lua",         enabled = false },
    { "CopilotC-Nvim/CopilotChat.nvim", branch = "canary",                         enabled = false },
})
