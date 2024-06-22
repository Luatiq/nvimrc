local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('rust'):fmt('rustfmt')

-- Call setup() LAST!
require('guard').setup({
    -- Choose to format on every write to a buffer
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
    -- By default, Guard writes the buffer on every format
    -- You can disable this by setting:
    -- save_on_fmt = false,
})

local gfmt = require('guard.format')
vim.keymap.set("n", "<leader>f", function() gfmt.do_fmt() end)
--vim.keymap.set("v", "<leader>f", function() gfmt.do_fmt() end, { buffer = true })
--vim.keymap.set("v", "<leader>f", function() gfmt.do_fmt() '<esc>' end, { buffer = true })
