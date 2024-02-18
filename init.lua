local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- This needs to be before lazy.nvim setup
-- vim.cmd("nnoremap <SPACE> <Nop>")
vim.opt.number = true

require("lazy").setup(require("plugins"))

require("luasnip.loaders.from_vscode").lazy_load()

-- To set the Leader key in Neovim using Lua, you can add the following line to your init.lua file:
vim.g.mapleader = " "

-- Example mapping using the Leader key

vim.cmd("colorscheme gruvbox")
vim.cmd("set background=dark")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")

local wk = require("which-key")

wk.register({
	["<leader>"] = {
		p = {
			name = "persistence.nvim",
			l = {
				function()
					require("persistence").load({ last = true })
				end,
				"Load last session",
			},
			s = { require("persistence").load, "Restore session for the current directory" },
			d = { require("persistence").stop, "Stop persistence.nvim" },
		},
		s = { "<cmd>Neotree<cr>", "Open neo-tree.nvim" },
		q = {
			name = "Quit commands",
			q = { vim.cmd.quit, "Quit window" },
			a = { vim.cmd.quitall, "Quit Vim" },
		},
		w = { vim.cmd.write, "Write" },
		f = {
			function()
				require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
			end,
			"Format with conform.nvim",
		},
	},
})
