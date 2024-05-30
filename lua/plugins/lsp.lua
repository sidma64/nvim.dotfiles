return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason.nvim",
		"b0o/schemastore.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local server_configs = {
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},
			cmake = {
				settings = {
					CMake = {
						filetypes = {"cmake", "CMakeLists.txt"}
					}
				}
			}
		}

		local default_config = {
			capabilities = capabilities,
		}

		require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({ensure_installed = {"lua_ls", "clangd", "gopls", "graphql", "html", "jsonls", "svelte", "tsserver", "cssls", "vuels", "pyright"}})
		mason_lspconfig.setup_handlers({
			function(server_name)
				local config = vim.tbl_deep_extend("force", default_config, server_configs[server_name] or {})
				require("lspconfig")[server_name].setup(config)
			end,
		})
	end,
}
