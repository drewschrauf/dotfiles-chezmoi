local M = {}

M.general = {
  n = {
    ["<leader>s"] = { ":update<CR>", "save" },
    ["<leader>i"] = { "^", "start of line" },
    ["<leader>a"] = { "$", "end of line" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>o"] = { ":BufOnly<CR>", "close other buffers" },
  },

  i = {
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

return M
