-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
    spec = {
        { import = 'plugin' },
    },
    -- colorscheme that will be used when installing plugins.
    install = {
        colorscheme = { 'catppuccin-mocha' },
    },
    -- automatically check for plugin updates
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    }
})
