-- nvim-treesitter `main` branch: the plugin installs parsers/queries, and
-- Neovim itself provides highlighting, folding and indentation.
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false, -- main branch does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            local ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "go" }
            ts.install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("stfu_treesitter", { clear = true }),
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                    if not (lang and vim.treesitter.language.add(lang)) then
                        return
                    end
                    vim.treesitter.start(args.buf, lang)
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
