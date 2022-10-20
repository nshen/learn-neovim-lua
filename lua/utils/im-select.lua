local M = {}

M.defaultIM = "com.apple.keylayout.ABC"
M.currentIM = M.defaultIM

local macInsertEnter = function()
  if M.currentIM then
    vim.cmd(":silent :!im-select" .. " " .. M.currentIM)
  else
    vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
  end
end

local macInsertLeave = function()
  M.currentIM = vim.fn.system({ "im-select" })
  vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
end

local windowsInsertLeave = function()
  vim.cmd(":silent :!~/.config/nvim/im-select.exe 1033")
end

local windowsInsertEnter = function()
  vim.cmd(":silent :!~/.config/nvim/im-select.exe 2052")
end

M.insertEnter = function()
  if vim.fn.executable("im-select") ~= 1 and vim.fn.executable("im-select.exe") ~= 1 then
    vim.notify("没有找到 im-select 无法切换输入法, https://github.com/daipeihust/im-select")
    return
  end

  if vim.fn.has("macunix") == 1 then
    macInsertEnter()
  elseif vim.fn.has("win32") then
    windowsInsertEnter()
  end
end

M.insertLeave = function()
  if vim.fn.executable("im-select") ~= 1 and vim.fn.executable("im-select.exe") ~= 1 then
    vim.notify("没有找到 im-select 无法切换输入法, https://github.com/daipeihust/im-select")
    return
  end
  if vim.fn.has("macunix") == 1 then
    macInsertLeave()
  elseif vim.fn.has("win32") then
    windowsInsertLeave()
  end
end

return M
