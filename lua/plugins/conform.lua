return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			cpp = { "clang_format" },
			c = { "clang_format" },
			go = { "gofmt" },
		},
	},
}
