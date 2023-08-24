local M = {}

-- Category: History
-- `u`: Toggles the display of the undo-tree
M.history = {
  n = {
    ["u"] = { "<cmd>lua require('undotree').toggle()<CR>", "Undo-Tree" },
  },
}

-- Category: Bookmark
-- `b`: Adds or removes a bookmark at the current line
-- `Space + bn`: Jumps to the next bookmark
-- `Space + bp`: Jumps to the previous bookmark
-- `Space + bc`: Clears all bookmarks
-- `Space + bm`: Opens a menu to manage bookmarks
M.bookmark = {
  n = {
    ["b"] = { "<cmd>:BookmarkToggle<CR>", "Add a bookmark" },
    ["<leader>bn"] = { "<cmd> BookmarkNext<CR>", "Next bookmark" },
    ["<leader>bp"] = { "<cmd> BookmarkPrev<CR>", "Prev bookmark" },
    ["<leader>bc"] = { "<cmd> BookmarkClear<CR>", "Clear bookmark" },
    ["<leader>bm"] = { "<cmd>Telescope vim_bookmarks all<CR>", "Bookmark Menu" },
  },
}

-- Category: Utils
-- `Space + fm`: Formats the code
-- `Space + rn`: Renames a file
-- `Ctrl + V`: Paste
-- `Ctrl + C`: Copy
M.utils = {
  n = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "Format code",
    },
    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "Rename file",
    },
  },
  i = {
    ["<"] = { "<><left>", "Auto Complete" },
    ["&"] = { "&", "Auto Complete" },
    ["|"] = { "|", "Auto complete" },
    ["<C-z>"] = { "<cmd>u<CR>", "󰕌 Undo" },
    ["<C-r>"] = { "<cmd>redo<CR>", "󰑎 Redo" },
  },
}

-- Category: Go
-- `Space + fi`: Formats and organizes import statements
-- `Space + gfs`: Fills a struct with zero values
-- `Space + go`: Runs the Go application
M.go = {
  n = {
    ["<leader>fi"] = { " <cmd>:GoImport<CR>", "Format imports", opts = { silent = true } },
    ["<leader>gfs"] = { " <cmd>:GoFillStruct<CR>", "Fill struct", opts = { silent = true } },
    ["<label>go"] = {
      ":!go run .<CR>",
      "Run go app",
    },
  },
}

-- Category: Search
-- `Space + s`: Starts an incremental search
-- `Space + sa`: Matches all occurrences
-- `Space + sr`: Performs a search and replace
M.search = {
  n = {
    ["<leader>s"] = { " <cmd>:SearchBoxIncSearch<CR>", "Search" },
    ["<leader>sa"] = { " <cmd>::SearchBoxMatchAll title='Search All'<CR>", "Match all" },
    ["<leader>sr"] = { " <cmd>:SearchBoxReplace<CR>", "Search and replace" },
  },
}

-- Category: Node
-- `Space + no`: Runs the Node.js application
M.node = {
  n = {
    ["<leader>no"] = {
      ":!node .<CR>",
      "Run node app.",
    },
  },
}

-- Category: Folding
-- `Space + f + a`: Opens all folds
-- `Space + f + c`: Closes all folds
M.fold = {
  n = {
    ["<leader>fa"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds",
    },
    ["<leader>fc"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all folds",
    },
  },
}

-- Ctrl+V = Paste
vim.api.nvim_set_keymap("n", "<C-v>", ":normal! p<CR>", { noremap = true })

-- Scroll while insert
vim.keymap.del("i", "<ScrollWheelUp>")
vim.keymap.del("i", "<ScrollWheelDown>")

return M
