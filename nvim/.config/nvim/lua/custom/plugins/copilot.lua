return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
    cond = function()
      vim.fn.system 'which gh'
      if vim.v.shell_error ~= 0 then
        return false
      end
      return true
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    cond = function()
      vim.fn.system 'which gh'
      if vim.v.shell_error ~= 0 then
        return false
      end
      return true
    end,
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = true,
  },
}