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

require("settings")

require("lazy").setup("plugins")

-- require("luasnip.loaders.from_vscode").lazy_load()

-- To set the Leader key in Neovim using Lua, you can add the following line to your init.lua file:

-- Example mapping using the Leader key
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
      s = {
        vim.lsp.buf.hover,
        "Show information for item on cursor",
      },
      f = { vim.lsp.buf.format, "Format with LSP" },
      a = { vim.lsp.buf.code_action, "Code action" },
      d = { vim.lsp.buf.definition, "Jump to definition" },
      D = { vim.lsp.buf.declaration, "Jump to declaration" },
    },
  },
})

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
