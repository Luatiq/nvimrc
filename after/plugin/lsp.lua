local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'phpactor', 'eslint', 'volar', 'lua_ls', 'sqls', 'marksman', 'bashls', 'html', 'cssls', 'rust_analyzer' },
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		phpactor = function()
			require('lspconfig').phpactor.setup{
				on_attach = on_attach,
				init_options = {
					["language_server_phpstan.enabled"] = true,
					["language_server_php_cs_fixer.enabled"] = true,
					["symfony.enabled"] = true
				}
			}
		end
	},
})

require('lspconfig').volar.setup {
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

require('lspconfig').ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}

local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<C-space>'] = cmp.mapping.complete(),
	})
})

