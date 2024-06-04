require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
  ensure_installed = { "php", "javascript", "vue", "lua", "vim", "vimdoc", "query", "sql", 'markdown', 'rust' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
