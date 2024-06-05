local cmp = require "cmp"
---@type NvPluginSpec[]
local plugins = {
  -- Plugim: nvim-cmp
  -- Purpose: Complation
  {
    "hrsh7th/nvim-cmp",
    opts = {
      experimental = {
        ghost_text = true,
      },
      
 sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 4 },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "nerdfont" },
    { name = "cmp-tw2css" },
    { name = "npm", keyword_length = 4 }
  },

     completion = {
       completeopt = "menu,menuone",
       autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        keyword_length = 1,
     },

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      
   mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Down>"] = cmp.mapping.close(),
    ["<Up>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }, 

      cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
    },
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "David-Kunz/cmp-npm",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      {
    		"L3MON4D3/LuaSnip",
	    	version = "2.*",
	     	build = "make install_jsregexp",
	    	dependencies = "rafamadriz/friendly-snippets",
    	},
      "ray-x/cmp-treesitter",
      "chrisgrieser/cmp-nerdfont",
      "jcha0713/cmp-tw2css",

    },
  },

  -- Plugin: error-lens.nvim
  -- Functionality: Highlights errors, warnings, information, and hints in the code.
  {
    "chikko80/error-lens.nvim",
    event = "BufRead",
    diependencies = {
      "nvim-telescope/telescope.nvim",
  },
    config = {
      enabled = true,
      auto_adjust = {
        enable = false,
        fallback_bg_color = nil,
        step = 7,
        total = 30,
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
        hint_bg = "#147828",
      },
    },
  },

  -- Plugin: nvim-ufo
  -- Functionality: Provides indentation and treesitter-based folding indicators.
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufReadPost",
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
        offset = -5,
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
    dependencies = { "nvim-treesitter" },
    config = function()
      -- default configuration
      require("illuminate").configure {
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 100,
        filetype_overrides = {},
        filetypes_denylist = {
          "dirvish",
          "fugitive",
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
      }
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
      require("undotree").setup {
        float_diff = true,
        layout = "left_bottom",
        ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
        window = {
          winblend = 30,
        },
        keymaps = {
          ["j"] = "move_next",
          ["k"] = "move_prev",
          ["J"] = "move_change_next",
          ["K"] = "move_change_prev",
          ["<cr>"] = "action_enter",
          ["p"] = "enter_diffbuf",
          ["q"] = "quit",
        },
      }
    end,
  },

  -- Plugin: statuscol.nvim
  -- Functionality: Displays statusline-like information in the column at the right of the buffer.
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require "statuscol.builtin"
      require("statuscol").setup {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          {
            sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
            click = "v:lua.ScSa",
          },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
            click = "v:lua.ScSa",
          },
        },
      }
    end,
  },

  -- Plugin: nvim-lspconfig
  -- Functionality: Provides configurations for Neovim's built-in LSP client.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require "custom.configs.null-ls"
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
        "emmet-ls",
      },
    },
  },

  -- Plugin: trouble.nvim
  -- Functionality: Integrates various navigation lists for LSP diagnostics and more.
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },

  -- Plugin: focus.nvim
  -- Functionality: Allows focusing on the current buffer.
  { "nvim-focus/focus.nvim", version = "*" },
 
  -- Plugin: templetes.nvim
  -- Purpose: templetes
  {
    "glepnir/template.nvim",
    cmd = { "Template", "TemProject" },
    config = function()
      require("template").setup {
        temp_dir = "~/.config/nvim/template/",
      }
      
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "find_template"
    end,
  },
  
  -- Plugin: code-biscuits
  -- Purpose: Contexts
  {
    "code-biscuits/nvim-biscuits",
    event = "BufReadPost",
    opts = {
      show_on_start = false,
      cursor_line_only = true,
      default_config = {
        min_distance = 10,
        max_length = 50,
        prefix_string = " 󰆘 ",
        prefix_highlight = "Comment",
        enable_linehl = true,
      },
    },
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
  -- Functionality: Provides fast color highlighting for CSS and other languages
  {
    "NvChad/nvim-colorizer.lua",
     opts = {
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true, 
        css = true, 
        css_fn = true, 
        mode = "foreground",
        tailwind = true,
        sass = { enable = true, parsers = { "css" }, },
        virtualtext = "■",
      },
    }
  },

  -- Plugin: lewis6991/gitsigns.nvim
  -- Purpose: Disable gitsigns
  {
    "lewis6991/gitsigns.nvim",
    enabled = false
  },

  -- Plugin: barbecue
  -- Purpose: Winbar
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },
  
  -- Plugin: tailwind-fold.nvim
  -- Purpose: Fold tailwund styling code
  {
    "razak17/tailwind-fold.nvim",
    opts = {
      min_chars = 50,
    },
    ft = { "html", "svelte", "javascripyreact", "typescriptreact" },
  },
}

return plugins
