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
vim.o.mapleader = " "
vim.wo.number = true
require "lazy".setup(require "plugins")

vim.g.editorconfig = true

vim.cmd("colorscheme gruvbox")
vim.cmd("set background=dark")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")






-- example to setup lua_ls and enable call snippets
