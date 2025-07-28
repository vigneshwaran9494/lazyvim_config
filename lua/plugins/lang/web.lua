return {
    -- React/JSX/TSX support
    {
      "windwp/nvim-ts-autotag",
      ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      opts = {},
    },
  
    -- Tailwind CSS
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local cmp = require("cmp")
        opts.sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "tailwindcss" },
        })
      end,
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      config = true,
    },
  }