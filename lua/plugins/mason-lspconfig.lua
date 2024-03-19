return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "lua_ls" },
		handlers = {
			function(server_name)
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				require("neodev").setup()
				require("lspconfig")["lua_ls"].setup({})
			end,
		},
	},
}
