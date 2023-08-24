-- Check if the 'null-ls' module is present and try to require it
-- The 'null-ls' module provides utilities for generating code actions and diagnostics
local present, null_ls = pcall(require, "null-ls")

-- If 'null-ls' is not present, return and stop further execution of the code
if not present then
  return
end

-- Import the 'builtins' table from the 'null-ls' module
-- This table contains a set of built-in code actions and diagnostics providers
local b = null_ls.builtins

-- Define a function 'with_diagnostics_code' that takes a 'builtin' and returns it with a diagnostics format
local with_diagnostics_code = function(builtin)
  return builtin.with {
    -- Set the diagnostics format to display messages and codes
    diagnostics_format = "#{m} [#{c}]",
  }
end

-- Define a function 'with_root_file' that takes a 'builtin' and a 'file' and returns it with a condition
local with_root_file = function(builtin, file)
  return builtin.with {
    -- Set a condition function that checks if the root has the specified file
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

-- Define a table 'sources' that holds various code formatting, diagnostics, and code actions sources
local sources = {
  -- Formatting sources
  b.formatting.prettierd.with { filetypes = { "vue", "css", "scss", "less", "html", "json", "jsonc", "markdown", "typescript", "typescriptreact", "javascript", "javascriptreact" } },
  b.formatting.golines,
  b.formatting.goimports,
  b.formatting.beautysh.with { filetypes = { "zsh", "sh" } },
  b.formatting.fixjson,
  b.formatting.stylua,

  -- Diagnostics sources
  b.diagnostics.write_good,
  b.diagnostics.shellcheck,

  -- Code action sources
  b.code_actions.eslint
}

-- Set up 'null-ls' with the defined sources and configuration options
null_ls.setup({
  -- Set 'debug' to false to disable debug output
  debug = false,
  -- Set the 'sources' option to the defined 'sources' table
  sources = sources,
  -- Set the 'on_attach' option to a function that runs on LSP client attachment
  on_attach = function(_, clientId)
    -- Check if the LSP client attachment was successful for the current buffer
    if vim.lsp.buf_attach_client(0, clientId) == true then
      -- If successful, create an autocommand to run 'vim.lsp.buf.format()' on BufWritePost event
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
