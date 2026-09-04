return {
    {
        "mbbill/undotree",
        cmd = { "UndotreeToggle", "UndotreeShow" },
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
        },
    },

    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G" },
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Git status" },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = { [[<C-\>]] },
        opts = {
            size = 10,
            open_mapping = [[<C-\>]],
        },
    },
}
