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
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Functionality
    { "echasnovski/mini.nvim",            version = false },
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
    },

    -- Theme & UI
    {
        "Ureakim/nebulae.nvim",
        lazy = false,
        priority = 1000
    },
    { "aserowy/tmux.nvim" },
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

    -- IA
    { "zbirenbaum/copilot.lua" },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- debug
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
})
