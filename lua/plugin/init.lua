return {
    'tpope/vim-fugitive',
    'williamboman/mason-lspconfig.nvim',
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                "phpcs",
                "php-cs-fixer",
            },
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle undotree' },
        }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = true
                },
            }
        },
        keys = {
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
    {
        "QuickGD/quickgd.nvim",
        ft = {"gdshader", "gdshaderinc"},
        cmd = {"GodotRun","GodotRunLast","GodotStart"},
        -- Use opts if passing in settings else use config
        init = function()
            vim.filetype.add {
                extension = {
                    gdshaderinc = "gdshaderinc",
                },
            }
        end,
        opts = {
            godot_path = "/home/lua/Gamedev/.godot/Godot.x86_64",
            telescope = true,
            treesitter = true,
            cmp = true,
        }
    },
}
