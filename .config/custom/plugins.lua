---@type NvPluginSpec[]
local plugins = {
  {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = {
      enabled = true,
      auto_adjust = {
        enable = false,
        fallback_bg_color = nil,
        step = 7,
        total = 30
      },
      prefix = 4,
      colors = {
        error_fg = "#FF6363",
        error_bg = "#4B252C",
        warn_fg = "#FA973A",
        warn_bg = "#403733",
        info_fg = "#5B38E8",
        info_bg = "#281478",
        hint_fg = "#25E64B",
        hint_bg = "#147828"
      }
    }
  },
  {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  keys = { "zf", "zo", "za", "zc", "zM", "zR" },
  config = function()
    require("ufo").setup {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    }
  end,
},
{
  "yaocccc/nvim-foldsign",
  event = "CursorHold",
  config = function()
    require("nvim-foldsign").setup {
      offset = -2,
      foldsigns = {
        open = "⌄", -- mark the beginning of a fold
        close = "˃", -- show a closed fold
        seps = { "", "" }, -- open fold middle marker
      },
    }
  end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.todo"
    end,
  },
  {
    "VonHeikemen/searchbox.nvim",
    cmd = { "SearchBoxMatchAll", "SearchBoxReplace", "SearchBoxIncSearch" },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = true,
  },
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    config = true,
  },
  {
    "MattesGroeger/vim-bookmarks",
    cmd = "BookmarkToggle",
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = "nvim-treesitter",
    config = function()
      -- default configuration
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
        delay = 100,
        filetype_overrides = {},
        filetypes_denylist = {
          'dirvish',
          'fugitive',
        },
        filetypes_allowlist = {},
        modes_denylist = {},
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
        large_file_cutoff = nil,
        large_file_overrides = nil,
        min_count_to_highlight = 1,
      })
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    event = "BufReadPost",
    config = function()
      require("auto-save").setup {
        enabled = true
      }
    end,
  },
  {
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('undotree').setup(
        {
          float_diff = true,
          layout = "left_bottom",
          ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
          window = {
            winblend = 30,
          },
          keymaps = {
            ['j'] = "move_next",
            ['k'] = "move_prev",
            ['J'] = "move_change_next",
            ['K'] = "move_change_prev",
            ['<cr>'] = "action_enter",
            ['p'] = "enter_diffbuf",
            ['q'] = "quit",
          }
        }
      )
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          {
            sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
            click = "v:lua.ScSa"
          },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
            click = "v:lua.ScSa"
          },
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
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
        "gopls",
        "tsserver",
        "prettier",
        "html_lsp",
        "emmet-ls"
      },
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}

return plugins
