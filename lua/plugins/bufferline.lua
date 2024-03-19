return {
	"akinsho/bufferline.nvim",
	opts = {},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup{}
	end
}
