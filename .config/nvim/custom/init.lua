-- Enable autosave in Vim.
vim.g.autosave = true

-- Register the 'html' language with the 'ejs' parser in Vim's treesitter plugin.
vim.treesitter.language.register('html', 'ejs')

-- Set the fold level to 99 in Vim. This means that all folds will be fully open.
vim.opt.foldlevel = 99;

-- ( Not recommended ) Configure Vim's diagnostic feature to disable virtual text, which means no inline error/warning messages.
-- vim.diagnostic.config({ virtual_text = false })

-- Load the custom status column configuration from the "custom.statuscolumn" module.
require "custom.statuscolumn"

-- Load the custom autocmd configuration from the "custom.autocmd" module.
require "custom.autocmd"
