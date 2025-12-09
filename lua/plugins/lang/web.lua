return {
    -- React/JSX/TSX support (including Next.js)
    {
      "windwp/nvim-ts-autotag",
      ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx", "javascript.jsx" },
      opts = {},
    },
  
    -- Completion (using blink.cmp instead of nvim-cmp)
    {
      "saghen/blink.cmp",
      opts = {
        sources = {
          default = { "lsp", "path", "snippets", "buffer", "tailwindcss", "emmet" },
        },
      },
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      config = true,
    },
  }