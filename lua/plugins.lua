return {
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		lazy = true,
	},
	{
		"neovim/nvim-lspconfig",
	},
	--"hrsh7th/nvim-cmp",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"typescript",
				"javascript",
				"graphql",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
				"cmake",
				"cpp",
				"python",
				"swift",
			},
			auto_install = false,
			sync_install = false,
			modules = {},
			ignore_install = {},
			highlight = {
				enable = true,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = false,
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {},
	},
	-- Lua
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
			options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
			pre_save = nil, -- a function to call before saving the session
			save_empty = false, -- don't save if there are no open file buffers
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- follow latest release.
	-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- 	-- install jsregexp (optional!).
	-- 	build = "make install_jsregexp",
	-- 	dependencies = { "rafamadriz/friendly-snippets" },
	-- },
	{
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
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.comment").setup()
			require("mini.completion").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	"nvim-lua/lsp-status.nvim",
	{
		"akinsho/bufferline.nvim",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {extensions = {"neo-tree", "lazy"}},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
