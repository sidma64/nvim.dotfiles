return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.tsserver.setup({ capabilities = capabilities })
		lspconfig.pyright.setup({ capabilities = capabilities })
		require("neodev").setup()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					hint = {
						enable = true,
					},
				},
			},
		})
		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.gopls.setup({ capabilities = capabilities })
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
}
