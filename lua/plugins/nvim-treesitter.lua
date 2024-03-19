return {
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
    autotag = {
      enable = true,
    },
  },
  dependencies = {
    {
      'windwp/nvim-ts-autotag',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equalent to setup({}) function
    },
    "nvim-treesitter/nvim-treesitter-context"
  }
}
