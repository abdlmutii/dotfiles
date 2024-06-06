-- Import g, treesitter, opt from vim
-- Import the global Vim configuration, treesitter plugin, and Vim options settings.
local g = vim.g
local opt = vim.opt
local treesitter = vim.treesitter

-- Enable autosave in Vim.
-- Set the global variable 'autosave' to true, enabling autosaving in Vim.
g.autosave = true

-- Register the 'html' language with the 'ejs' parser in Vim's treesitter plugin.
-- This line associates the 'html' language with the 'ejs' parser in Vim's treesitter plugin,
-- enhancing syntax highlighting and code manipulation for HTML files with embedded EJS templates.
treesitter.language.register("html", "ejs")

-- Set the fold level to 99 in Vim. This means that all folds will be fully open.
-- Set the option 'foldlevel' to 99, expanding all code folds when the file is opened.
opt.foldlevel = 99

-- Enable smart indentation in Vim.
-- Enable the 'smartindent' option, which automatically adjusts the indentation level based on the context of the code.
opt.smartindent = true

-- ( Not recommended ) Make Vim's search functionality case-sensitive with uppercase characters,
-- and case-insensitive with lowercase characters.
-- Enable the 'smartcase' option to enable smart case-sensitive searching in Vim.
-- opt.smartcase = true

-- Enable automatic indentation for newly added lines.
-- Enable the 'autoindent' option, automatically indenting new lines based on the surrounding code.
opt.autoindent = true

-- Enable consistent indentation when wrapping lines in Vim.
-- Enable the 'breakindent' option to maintain consistent indentation when wrapping lines.
opt.breakindent = true

-- Set the wrap to wrap the code text
-- Setting it to true will wrap text
opt.wrap = true -- or false..

-- Set the clipboard option to use the system clipboard for copying and pasting.
-- Set the 'clipboard' option to "unnamedplus" to use the system clipboard.
opt.clipboard = "unnamedplus"

-- Set mouse option to not copy lines while copying code
opt.mouse = "a"

-- Arabic
opt.arabicshape = true
opt.encoding = "utf-8"
opt.termbidi = true

-- ( Not recommended ) Configure Vim's diagnostic feature to disable virtual text,
-- which means no inline error/warning messages will be displayed.
-- This line disables virtual text for diagnostics in Vim (not recommended).
-- vim.diagnostic.config({ virtual_text = false })

-- NOT RECOMMENDED: Discord presence ( when to count as idle, that'll mess up illumaniti plugin ):
-- opts.updatetime = 7000 
