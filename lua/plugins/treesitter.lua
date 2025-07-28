return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Core languages
        "lua",
        "vim",
        "vimdoc",
        
        -- Web development
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        "yaml",
        "toml",
        
        -- Markup
        "markdown",
        "markdown_inline",
        
        -- Scripting
        "bash",
        "python",
        "regex",
        
        -- Query files for treesitter
        "query",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    },
  },
} 