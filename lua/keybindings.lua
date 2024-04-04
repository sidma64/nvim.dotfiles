return {
	["<F12>"] = { vim.lsp.buf.definition, "Jump to definition" },
	["<c-F12>"] = { vim.lsp.buf.declaration, "Jump to declaration" },
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
			name = "Telescope.nvim commands",
			f = { require("telescope.builtin").find_files, "Find files" },
			b = { require("telescope.builtin").buffers, "Find buffers" },
			g = { require("telescope.builtin").live_grep, "Live grep" },
			h = { require("telescope.builtin").help_tags, "Help tags" },
		},
		F = {
			function()
				require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
			end,
			"Format with conform.nvim",
		},
		l = {
			name = "LSP commands",
			s = { vim.lsp.buf.hover, "Show information for item on cursor" },
			f = { vim.lsp.buf.format, "Format with LSP" },
			a = { vim.lsp.buf.code_action, "Code action" },
			d = { vim.lsp.buf.definition, "Jump to definition" },
			D = { vim.lsp.buf.declaration, "Jump to declaration" },
		},
	},
	g = {
		d = { vim.lsp.buf.definition, "Goto definition" },
		r = { vim.lsp.buf.references, "Goto references" },
		D = { vim.lsp.buf.declaration, "Goto declaration" },
	},
	K = { vim.lsp.buf.hover, "Hover LSP" },
}
