vim.g.autosave = true;
vim.treesitter.language.register('html', 'ejs');
vim.opt.foldlevel = 99;
vim.diagnostic.config({ virtual_text = false })

require "custom.statuscolumn"
require "custom.autocmd"