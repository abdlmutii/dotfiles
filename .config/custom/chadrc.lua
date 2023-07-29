---@type ChadrcConfig
local M = {}

-- import the Highlights file
local highlights = require "custom.highlights"

M.ui = {
 -- the theme, toggle transparent background, 
 theme = "radium",
 -- transparency = true,

 -- statusline
 statusline = {
    theme = "default",
    separator_style = "round"
  },

 -- tabufline without any buttons ( i dont like that )
  tabufline = {
      overriden_modules = function()
    return {
        buttons = function()
        return ""
        end,
      }
      end,
  },

 -- override the style of comments, mouse cursor, etc..
  hl_override = highlights.override
}

-- when you edit plugins.lua, you wont get warnings
M.lazy_nvim = {
  change_detection = { enabled = false }
}

-- Import plugins and mappings
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
