-- Create an autocmd that triggers on "InsertLeave" and "TextChanged" events.
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  -- Group the autocmd under the name "Autosave".
  group = vim.api.nvim_create_augroup("Autosave", {}),
  -- Define the callback function for the autocmd.
  callback = function()
    -- Check if autosave is enabled, the buffer has a name, and it's listed.
    if vim.g.autosave and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      -- If conditions are met, silently write the buffer to save changes.
      vim.cmd "silent w"
    end
  end,
})

-- Create an autocmd that triggers on "BufWritePre" event for specific file types.
vim.api.nvim_create_autocmd("BufWritePre", {
  -- Command to run when the event is triggered - in this case, format the buffer using LSP.
  command = "lua vim.lsp.buf.format()",
  -- The pattern specifies filetypes for which the autocmd should trigger.
  pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml,*.c,*.dart",
})

-- Get back back to last location
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Create a user-defined command called "Autosave".
vim.api.nvim_create_user_command("Autosave", function()
  -- Toggle the global variable "autosave" when the command is executed.
  vim.g.autosave = not vim.g.autosave
end, {})
