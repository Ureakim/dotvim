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
    {
        "Ureakim/nebulae.nvim",
        lazy = false,
        priority = 1000
    },
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-treesitter/nvim-treesitter",
        init = TSUpdate
    },
    { "neovim/nvim-lspconfig" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
    },
    { "mfussenegger/nvim-dap" },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },

    { "zbirenbaum/copilot.lua" },
    { "CopilotC-Nvim/CopilotChat.nvim",   branch = "canary" },

    { "nvim-lualine/lualine.nvim" },

    { "dcampos/nvim-snippy" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "nvim-telescope/telescope.nvim",    branch = "0.1.x" },
    { "nvim-telescope/telescope-ui-select.nvim" },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
})
