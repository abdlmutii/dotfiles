---@type ChadrcConfig
local M = {}

-- import the Highlights file
local highlights = require "custom.highlights"

M.ui = {
  -- the theme, toggle transparent background,
  theme = "nightowl",
  -- lsp_semantic_tokens = true,
  -- transparency = true,

  -- statusline
  statusline = {
    theme = "default",
    separator_style = "round",
    overriden_modules = function(modules)
         table.remove(modules, 6)
         table.remove(modules, 3)
      end,
  },

  -- tabufline without any buttons ( i dont like that )
  tabufline = {
    overriden_modules = function(modules)
         table.remove(modules,4)
      end,
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  -- override the style of comments, mouse cursor, etc..
  hl_override = highlights.override,
}

-- when you edit plugins.lua, you wont get warnings
M.lazy_nvim = {
  change_detection = { enabled = false },
}

-- Import plugins and mappings
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
