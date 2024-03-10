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
vim.g.mapleader = " "

require("lazy").setup("plugins")

require("settings")
-- require("luasnip.loaders.from_vscode").lazy_load()


require("which-key").register(require"keybindings")

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
