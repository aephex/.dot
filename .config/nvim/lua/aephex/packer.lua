vim.cmd([[packadd packer.nvim]]);

return require('packer').startup(function(use)
    -- Packer manages itself
    use { 'wbthomason/packer.nvim' }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            'nvim-lua/plenary.nvim',

            -- Telescope Extensions
            'cljoly/telescope-repo.nvim',
            'ahmedkhalf/project.nvim',
            'nvim-telescope/telescope-file-browser.nvim'
        }
    }


    -- Utilities
    use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'AckslD/nvim-FeMaco.lua', config = 'require("femaco").setup()' }
    use { 'tpope/vim-fugitive' }
    use {
        'gennaro-tedesco/nvim-possession',
        requires = { 'ibhagwan/fzf-lua' },
        run = ':!mkdir -p ~/.local/share/nvim/sessions'
    }
    use { 'kevinhwang91/rnvimr' }
    use { 'mbbill/undotree' }
    use { 'folke/which-key.nvim' }
    use { 'nathom/filetype.nvim' }


    -- Statusline / Tabline
    use { 'nvim-lualine/lualine.nvim',
        requires = {
            { 'kyazdani42/nvim-web-devicons', opt = true },
            'arkav/lualine-lsp-progress'
        }
    }


    -- Themes
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'folke/tokyonight.nvim', as = 'tokyonight' }
    use { 'EdenEast/nightfox.nvim', as = 'nightfox' }
    use { 'rebelot/kanagawa.nvim', as = 'kanagawa' }
    use { 'embark-theme/vim', as = 'embark' }
    use { 'rose-pine/neovim', as = 'rose-pine' }


    -- LSP
    -- Treesitter; like DOM+magic for any document
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }

    -- LSP-Zero; because configuring things can be automatic
    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- Installation/Configuration Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Completion Support
            { 'hrsh7th/nvim-cmp' },

            -- Snippet Support
            { 'L3MON4D3/LuaSnip' },

            -- You complete (me) snippets
            { 'saadparwaiz1/cmp_luasnip' },

            -- Completions
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'folke/neodev.nvim' },
            { 'chrisgrieser/cmp-nerdfont' },

            -- Show signature help while typing
            { 'ray-x/lsp_signature.nvim' },

            -- Snippets
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Fill in the LSP gaps with null-ls
    use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
end)
