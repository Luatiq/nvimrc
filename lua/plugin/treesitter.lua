return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                'html',
                'javascript',
                'php',
                'twig',
                'vue',
                'query',
                'sql',
                'markdown',
                'rust',
                'lua',
                'luadoc',
                'vim',
                'vimdoc',
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },  
        })
    end
}
