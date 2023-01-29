return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    "akinsho/toggleterm.nvim",
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },

    { "catppuccin/nvim", as = "catppuccin" },

    -- use {
    --     'lervag/vimtex',
    --     'savq/paq-nvim',
    --     'frabjous/knap',
    -- }

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    'lervag/vimtex',
    'fatih/vim-go',
    'phelipetls/jsonpath.nvim',

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }

    },

    -- use 'jpalardy/vim-slime'

    'ThePrimeagen/harpoon',

    'j-hui/fidget.nvim',

    'ray-x/lsp_signature.nvim',

    { 'echasnovski/mini.pairs', branch = 'stable', config = function() require("mini.pairs").setup() end },

    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end
    },

    'nvim-treesitter/playground',

    'mfussenegger/nvim-jdtls',

    'tpope/vim-projectionist',
    'andyl/vim-projectionist-elixir',


}
