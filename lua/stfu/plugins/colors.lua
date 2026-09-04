-- Strip the background so the terminal's own transparency shows through.
function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { light = "latte", dark = "mocha" },
                transparent_background = false,
                show_end_of_buffer = false,
                term_colors = false,
                dim_inactive = { enabled = false, shade = "latte", percentage = 0.15 },
                no_italic = false,
                no_bold = false,
                no_underline = false,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = false,
                },
            })

            ColorMyPencils("catppuccin")
        end,
    },

    -- Installed as an alternative: `:lua ColorMyPencils("rose-pine")`
    { "rose-pine/neovim", name = "rose-pine", lazy = true },
}
