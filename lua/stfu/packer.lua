-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
:
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('mbbill/undotree')

    use ('tpope/vim-fugitive')
    --- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
            
            }  
        }
    --- Theme 
       use { "catppuccin/nvim", as = "catppuccin" }

         use({ 'rose-pine/neovim', 
         as = 'rose-pine',
         config = function()
         vim.cmd('colorscheme rose-pine')
         end
         })

        -- toggleterm
        use {
            "akinsho/toggleterm.nvim", tag = '*', 
            config = function()
                require("toggleterm").setup()
                end
        }

        use('mfussenegger/nvim-dap')
        use('theprimeagen/harpoon')
        use('leoluz/nvim-dap-go')
end)

