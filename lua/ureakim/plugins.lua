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
    { "Ureakim/nebulae.nvim",             lazy = false,                                                       priority = 1000 },
    { "nvim-treesitter/nvim-treesitter",  init = TSUpdate },
    { "neovim/nvim-lspconfig" },
    { "windwp/nvim-autopairs",            event = "InsertEnter" },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",             dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

    { "nvim-lualine/lualine.nvim" },

    { "dcampos/nvim-snippy" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "ibhagwan/fzf-lua" },

    { "folke/noice.nvim",                 event = "VeryLazy",                                                 dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
})
