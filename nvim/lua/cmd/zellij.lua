local M = {}

local function pane(direction)
  vim.fn.system('zellij action switch-mode normal && zellij action move-focus ' .. direction)
  if vim.v.shell_error ~= 0 then
    error 'zellij cant move to pane on that direction'
  end
end

local function floating()
  vim.fn.system 'zellij action switch-mode normal && zellij action toggle-floating-panes'
  if vim.v.shell_error ~= 0 then
    error 'zellij cant open floating pane'
  end
end

function M.up()
  pane 'up'
end

function M.down()
  pane 'down'
end

function M.right()
  pane 'right'
end

function M.left()
  pane 'left'
end

function M.floating()
  floating()
end

return M