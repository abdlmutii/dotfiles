---@type ChadrcConfig
local M = {}

-- import the Highlights file
local highlights = require "custom.highlights"

M.ui = {
  -- the theme, toggle transparent background,
  theme = "catppuccin",
  lsp_semantic_tokens = true,
 -- transparency = true,

  -- statusline
  statusline = {
    -- set theme and make the statusline rounded
    theme = "default",
    separator_style = "round",
    
    -- remove git signs ( it looks bad for me )
    overriden_modules = function(modules)
         table.remove(modules, 3) 
         table.remove(modules, 6)
         table.remove(modules, 10)
        -- table.remove(modules, 12)
      end,
  },

  -- tabufline without any buttons ( i dont like that )
  tabufline = {
    overriden_modules = function(modules)
         table.remove(modules,4)
      end,
  },
 
  -- CMP 
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  -- override the style of comments, mouse cursor, etc..
  hl_override = highlights.override,

  -- Add navic.nvim to nvchad:
  extended_integrations = { "navic" },
}

-- when you edit plugins.lua, you wont get warnings
M.lazy_nvim = {
  change_detection = { enabled = false },
}

-- Import plugins and mappings
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
