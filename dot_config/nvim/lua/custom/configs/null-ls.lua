local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd.with {
    condition = function(utils)
      return utils.root_has_file { ".prettierrc", ".prettierrc.yml" }
    end,
  },
  formatting.stylua,
  lint.eslint_d.with {
    condition = function(utils)
      return utils.root_has_file { ".eslintrc", ".eslintrc.yml" }
    end,
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}
