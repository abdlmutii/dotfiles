---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
 theme = "radium",
-- transparency = true,
 statusline = {
    theme = "default",
    separator_style = "round"
  },
  tabufline = {
      overriden_modules = function()
    return {
        buttons = function()
        return ""
        end,
      }
      end,
  },
  hl_override = highlights.override
}

M.lazy_nvim = {
  change_detection = { enabled = false }
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
