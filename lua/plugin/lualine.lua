return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local lualine = require("lualine")

        lualine.setup({
            options = {
                icons_enabled = false,
                theme = 'moonfly',
                extensions = {
                    'fugitive',
                    'lazy',
                    'mason',
                    'nvim-dap-ui',
                }
            }
        })
    end
}
