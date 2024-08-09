vim.opt.runtimepath:append("$HOME/.local/share/treesitter")

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            parser_install_dir = "$HOME/.local/share/treesitter",
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
                'yaml',
                'regex',
                'markdown',
                'markdown_inline',
                'json',
                'diff',
                'c',
                'bash',
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
