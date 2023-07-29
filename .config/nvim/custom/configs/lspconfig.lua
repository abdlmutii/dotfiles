-- Import the 'on_attach' function from the 'plugins.configs.lspconfig' module
local on_attach = require("plugins.configs.lspconfig").on_attach

-- Import the 'capabilities' function from the 'plugins.configs.lspconfig' module
local capabilities = require("plugins.configs.lspconfig").capabilities

-- Import the 'lspconfig' Lua library
local lspconfig = require "lspconfig"

-- Define a table with the names of language servers to be set up
local servers = { "html", "cssls", "tsserver", "gopls" }

-- Loop through each language server in the 'servers' table and set up their configurations
for _, lsp in ipairs(servers) do
  -- Call the 'setup' function for the current language server with the following configuration options
  lspconfig[lsp].setup {
    -- Set the 'on_attach' option to the previously imported 'on_attach' function
    on_attach = on_attach,
    -- Set the 'capabilities' option to the previously imported 'capabilities' function
    capabilities = capabilities,
  }
end

-- Set up the configuration for the Emmet language server
lspconfig.emmet_ls.setup {
  -- Specify the filetypes to trigger the Emmet language server
  filetypes = {'html', 'javascriptreact', 'ejs', 'typescriptreact'},
  -- Set the 'on_attach' option to the previously imported 'on_attach' function
  on_attach = on_attach,
  -- Set the 'capabilities' option to the previously imported 'capabilities' function
  capabilities = capabilities
}
