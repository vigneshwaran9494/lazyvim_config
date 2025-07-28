local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Navigation
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Terminal
map("n", "<C-`>", ":ToggleTerm<CR>", opts)
map("t", "<C-`>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)

-- VS Code-like keymaps (avoiding system conflicts)
-- Cmd+Click for go to definition (Cmd is D- on macOS)
map("n", "<D-LeftMouse>", vim.lsp.buf.definition, opts)
map("i", "<D-LeftMouse>", vim.lsp.buf.definition, opts)

-- Common VS Code shortcuts (conflict-free)
map("n", "<D-S-f>", ":Telescope find_files<CR>", opts)  -- Find files
map("n", "<D-S-p>", ":Telescope live_grep<CR>", opts)   -- Command palette
map("n", "<D-b>", ":NvimTreeToggle<CR>", opts)          -- Toggle explorer
map("n", "<D-/>", ":CommentToggle<CR>", opts)           -- Toggle comments
map("v", "<D-/>", ":CommentToggle<CR>", opts)

-- File operations (using Alt/Option key to avoid conflicts)
map("n", "<M-s>", ":w<CR>", opts)                       -- Save (Alt+S)
map("n", "<M-S-s>", ":wa<CR>", opts)                    -- Save all (Alt+Shift+S)
map("n", "<M-n>", ":enew<CR>", opts)                    -- New file (Alt+N)
map("n", "<M-w>", ":bdelete<CR>", opts)                 -- Close buffer (Alt+W)

-- Editing (using Alt/Option key)
map("n", "<M-z>", ":undo<CR>", opts)                    -- Undo (Alt+Z)
map("n", "<M-S-z>", ":redo<CR>", opts)                  -- Redo (Alt+Shift+Z)
map("n", "<M-x>", '"+x', opts)                          -- Cut (Alt+X)
map("n", "<M-c>", '"+y', opts)                          -- Copy (Alt+C)
map("n", "<M-v>", '"+p', opts)                          -- Paste (Alt+V)
map("v", "<M-x>", '"+x', opts)                          -- Cut (Alt+X)
map("v", "<M-c>", '"+y', opts)                          -- Copy (Alt+C)
map("v", "<M-v>", '"+p', opts)                          -- Paste (Alt+V)

-- Search and replace (using Alt/Option key)
map("n", "<M-f>", "/", opts)                            -- Search (Alt+F)
map("n", "<M-r>", ":%s/", opts)                         -- Replace (Alt+R)
map("v", "<M-r>", ":s/", opts)                          -- Replace selection (Alt+R)

-- Window management (using Alt/Option key)
map("n", "<M-1>", ":1wincmd w<CR>", opts)              -- Window 1 (Alt+1)
map("n", "<M-2>", ":2wincmd w<CR>", opts)              -- Window 2 (Alt+2)
map("n", "<M-3>", ":3wincmd w<CR>", opts)              -- Window 3 (Alt+3)
map("n", "<M-4>", ":4wincmd w<CR>", opts)              -- Window 4 (Alt+4)
map("n", "<M-5>", ":5wincmd w<CR>", opts)              -- Window 5 (Alt+5)
map("n", "<M-6>", ":6wincmd w<CR>", opts)              -- Window 6 (Alt+6)
map("n", "<M-7>", ":7wincmd w<CR>", opts)              -- Window 7 (Alt+7)
map("n", "<M-8>", ":8wincmd w<CR>", opts)              -- Window 8 (Alt+8)
map("n", "<M-9>", ":9wincmd w<CR>", opts)              -- Window 9 (Alt+9)

-- Buffers
map("n", "<leader>bd", ":bdelete<CR>", opts)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)

return {}