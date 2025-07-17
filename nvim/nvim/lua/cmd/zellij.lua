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

local function nexttab()
  vim.fn.system 'zellij action go-to-next-tab'
  if vim.v.shell_error ~= 0 then
    error 'zellij cant move to next tab'
  end
end

local function previoustab()
  vim.fn.system 'zellij action go-to-previous-tab'
  if vim.v.shell_error ~= 0 then
    error 'zellij cant move to previous tab'
  end
end

local function newtab()
  vim.fn.system 'zellij action new-tab'
  if vim.v.shell_error ~= 0 then
    error 'zellij cant open a new tab'
  end
end

local function fullscreen()
  vim.fn.system 'zellij action toggle-fullscreen'
  if vim.v.shell_error ~= 0 then
    error 'zellij cant fullscreen current pane'
  end
end

local function run(cmd)
  vim.fn.system('zellij run -f -c --  ' .. cmd)
  if vim.v.shell_error ~= 0 then
    error 'zellij cant run command'
  end
end

local function run_pane(cmd)
  vim.fn.system('zellij run  -c --  ' .. cmd)
  if vim.v.shell_error ~= 0 then
    error 'zellij cant run command'
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

function M.nexttab()
  nexttab()
end

function M.previoustab()
  previoustab()
end

function M.newtab()
  newtab()
end

function M.fullscreen()
  fullscreen()
end

function M.zkpull()
  run 'zk pull'
end

function M.zkpush()
  run 'zk push'
end

function M.nvim_pane()
  run_pane 'nvim'
end

return M
