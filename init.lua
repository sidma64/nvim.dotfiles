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

-- require("luasnip.loaders.from_vscode").lazy_load()

-- To set the Leader key in Neovim using Lua, you can add the following line to your init.lua file:
vim.g.mapleader = " "

-- Example mapping using the Leader key

vim.g.neovide_fullscreen = true

vim.cmd("colorscheme gruvbox")
vim.cmd("set background=dark")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")
vim.opt.relativenumber = true

local wk = require("which-key")

wk.register()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").tsserver.setup({ capabilities = capabilities })
require("lspconfig").pyright.setup({ capabilities = capabilities })
require("neodev").setup()
require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
		},
	},
})
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").cssls.setup({ capabilities = capabilities })
require("lspconfig").html.setup({ capabilities = capabilities })
require("lspconfig").gopls.setup({ capabilities = capabilities })
