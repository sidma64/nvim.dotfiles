return {
	"akinsho/bufferline.nvim",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
	end,
	dependencies = { "catppuccin/nvim" },
}
