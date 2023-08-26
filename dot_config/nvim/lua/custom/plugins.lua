local plugins = {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hcl",
        "terraform",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "prettierd",
        "eslint_d",
        "terraform-ls",
      },
    },
  },

  { "christoomey/vim-tmux-navigator", lazy = false },
  { "vim-scripts/BufOnly.vim", cmd = "BufOnly" },
  { "romainl/vim-cool", lazy = false },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  { "tpope/vim-surround", lazy = false },
}

return plugins
