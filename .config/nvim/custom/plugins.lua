---@type NvPluginSpec[]
local plugins = {
  -- Plugin: error-lens.nvim
  -- Functionality: Highlights errors, warnings, information, and hints in the code.
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
  -- Plugin: typescript-tools.nvim
  -- Functionality: Enhances TypeScript and JavaScript editing.
  {
    "pmizio/typescript-tools.nvim",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {},
  },
  -- Plugin: nvim-ufo
  -- Functionality: Provides indentation and treesitter-based folding indicators.
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
  -- Plugin: nvim-foldsign
  -- Functionality: Configurable folding signs and markers.
  {
    "yaocccc/nvim-foldsign",
    event = "CursorHold",
    config = function()
      require("nvim-foldsign").setup {
        offset = -2,
        foldsigns = {
          open = "⌄", -- mark the beginning of a fold
          close = ">", -- show a closed fold
          seps = { "", "" }, -- open fold middle marker
        },
      }
    end,
  },
  -- Plugin: todo-comments.nvim
  -- Functionality: Allows highlighting and navigation of TODO comments.
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.todo"
    end,
  },
  -- Plugin: searchbox.nvim
  -- Functionality: Extends Neovim's searching capabilities with UI elements.
  {
    "VonHeikemen/searchbox.nvim",
    cmd = { "SearchBoxMatchAll", "SearchBoxReplace", "SearchBoxIncSearch" },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = true,
  },
  -- Plugin: pretty_hover
  -- Functionality: Improves the LSP hover UI.
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    config = true,
  },
  -- Plugin: vim-bookmarks
  -- Functionality: Adds bookmarks to code for easy navigation.
  {
    "MattesGroeger/vim-bookmarks",
    cmd = "BookmarkToggle",
  },
  -- Plugin: vim-illuminate
  -- Functionality: Highlights symbols under the cursor and their usages.
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
  -- Plugin: undotree
  -- Functionality: Visualizes the undo tree and allows navigation within it.
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
  -- Plugin: statuscol.nvim
  -- Functionality: Displays statusline-like information in the column at the right of the buffer.
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
  -- Plugin: nvim-lspconfig
  -- Functionality: Provides configurations for Neovim's built-in LSP client.
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- Plugin: mason.nvim
  -- Functionality: Simplifies the installation of language servers.
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
  -- Plugin: trouble.nvim
  -- Functionality: Integrates various navigation lists for LSP diagnostics and more.
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {},
  },
  -- Plugin: focus.nvim
  -- Functionality: Allows focusing on the current buffer.
  { 'nvim-focus/focus.nvim', version = '*' },
  -- Plugin: winbar.nvim
  -- Functionality: Provides a dynamic status bar in the right column of the buffer.
  {
    "fgheng/winbar.nvim",
    config = function ()
      require('winbar').setup({
        enabled = true,

        show_file_path = true,
        show_symbols = true,

        -- Define custom colors if desired.
        -- colors = {
        --   path = '', 
        --   file_name = '',
        --   symbols = '',
        -- },

        icons = {
          -- file_icon_default = '',
          seperator = '>',
          -- editor_state = '●',
          -- lock_icon = '',
        },

        exclude_filetype = {
          'help',
          'startify',
          'dashboard',
          'packer',
          'neogitstatus',
          'NvimTree',
          'Trouble',
          'alpha',
          'lir',
          'Outline',
          'spectre_panel',
          'toggleterm',
          'qf',
        }
      })
    end,
  },
  -- Plugin: nvim-cmp
  -- Functionality: Completion plugin powered by LSP sources and more.
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      { "jcdickinson/codeium.nvim", config = true }
    },
    opts = {
      experimental = {
        ghost_text = true,
      }
    },
    sources = {
      { name = "codeium" }
    }
  },
  -- Plugin: go.nvim
  -- Functionality: Improves Go development in Neovim.
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
  -- Plugin: nvim-colorizer.lua
  -- Functionality: Provides fast color highlighting for CSS and other languages.
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
        RRGGBBAA = true,
      },
    }
  }
}

return plugins
