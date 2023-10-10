-- Create an autocmd that triggers on "InsertLeave" and "TextChanged" events.
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  -- Group the autocmd under the name "Autosave".
  group = vim.api.nvim_create_augroup("Autosave", {}),
  -- Define the callback function for the autocmd.
  callback = function()
    -- Check if autosave is enabled, the buffer has a name, and it's listed.
    if vim.g.autosave and #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      -- If conditions are met, silently write the buffer to save changes.
      vim.cmd "silent w!"
    end
  end,
})

-- Insert mode upon entering nvim
-- vim.api.nvim_create_autocmd("BufEnter", {
  -- callback = function()
  --  vim.cmd 'silent startinsert!'
  -- end
--})

-- Create an autocmd that triggers on "BufWritePre" event for specific file types.
vim.api.nvim_create_autocmd("BufWritePre", {
  -- Command to run when the event is triggered - in this case, format the buffer using LSP.
  command = "lua vim.lsp.buf.format()",
  -- The pattern specifies filetypes for which the autocmd should trigger.
  pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml,*.c,*.dart",
})

-- Get back to last location
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- A.I 
vim.api.nvim_create_user_command("GPT", function(args)
  vim.api.nvim_command('silent :.!node ~/ai.js code gpt "' .. table.concat({ args }, " ") .. '"')
end, { nargs = "*" })

--[[ Discord presence
local filename = vim.fn.expand "%:p"
local giturl = "https://github.com/abdlnutii"
local project_directory = vim.fn.getcwd()
local fileline = vim.api.nvim_buf_line_count(0)

local function on_exit(job_id, code, event)
  -- print(data)
end

local function on_stdout(job_id, data, event)
  -- print(data)
end

local function on_stderr(job_id, data, event)
  -- print(data)
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- if job_id then
    --   vim.fn.jobstop(job_id)
    -- end
    -- local command =
    --   string.format("node ~/discord/presence.js %s %s %s %s edit", filename, fileline, giturl, project_directory)
    -- local job_id = vim.fn.jobstart(command, {
    --   on_exit = on_exit,
    --   on_stdout = on_stdout,
    --   on_stderr = on_stderr,
    -- })
  end,
})

vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    -- if job_id then
    --   vim.fn.jobstop(job_id)
    -- end
    -- local command =
    --   string.format("node ~/discord/presence.js %s %s %s %s idle", filename, fileline, giturl, project_directory)
    -- local job_id = vim.fn.jobstart(command, {
    --   on_exit = on_exit,
    --   on_stdout = on_stdout,
    --   on_stderr = on_stderr,
    -- })
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    -- if job_id then
    --   vim.fn.jobstop(job_id)
    -- end
    -- local command =
    --   string.format("node ~/discord/presence.js %s %s %s %s view", filename, fileline, giturl, project_directory)
    -- local job_id = vim.fn.jobstart(command, {
    --   on_exit = on_exit,
    --   on_stdout = on_stdout,
    --   on_stderr = on_stderr,
    -- })
  end,
})

vim.api.nvim_create_autocmd({"BufLeave", "VimLeave"}, {
  callback = function()
    -- if job_id then
    --   vim.fn.jobstop(job_id)
    -- end
    -- local command =
    --   string.format("node ~/discord/presence.js %s %s %s %s exit", filename, fileline, giturl, project_directory)
    -- local job_id = vim.fn.jobstart(command, {
    --   on_exit = on_exit,
    --   on_stdout = on_stdout,
    --   on_stderr = on_stderr,
    -- })
  end,
})--]]
