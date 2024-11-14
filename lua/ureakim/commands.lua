local group = vim.api.nvim_create_augroup("UreakimAugroup", { clear = true })

-- close preview split after completion
vim.api.nvim_create_autocmd({ "InsertLeave", "CompleteDone" }, {
    callback = function()
        if vim.fn.pumvisible() == 0 then
            vim.cmd("pclose")
        end
    end,
    group = group,
})

-- toggle the background between light and dark and refresh the current colorscheme
local function toggleBackground()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end

    -- refresh the current colorscheme
    local cs = vim.g.colors_name
    vim.cmd.colorscheme(cs)
end
vim.api.nvim_create_user_command("ToggleBackground", toggleBackground, {})
