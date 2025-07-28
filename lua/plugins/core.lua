return {
    -- File explorer
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        view = { width = 30 },
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "",
                arrow_open = "",
              },
            },
          },
        },
      },
    },
  
    -- Fuzzy finder
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
      },
      opts = {
        defaults = {
          layout_strategy = "vertical",
          layout_config = { height = 0.95 },
        },
      },
    },
  
    -- Terminal
    {
      "akinsho/toggleterm.nvim",
      opts = {
        size = 15,
        open_mapping = [[<C-`>]],
        direction = "float",
        auto_chdir = true,
      },
    },
  
    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },

    -- Image preview (modern, maintained)
    {
      "samodostal/image.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("image").setup {
          backend = "kitty", -- or "ueberzug", "wezterm", "sixel", etc.
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              filetypes = { "markdown", "vimwiki", "org" },
            },
          },
          max_width = 100,
          max_height = 12,
        }
      end,
      ft = { "markdown", "vimwiki", "org" },
    },
  }