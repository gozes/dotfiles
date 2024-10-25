return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup { enable_builtin = true, suppress_missing_scope = { projects_v2 = true } }
    vim.cmd [[hi OctoEditable guibg=none]]
    vim.keymap.set('n', '<leader>Gpl', '<cmd>Octo pr list<cr>', { desc = 'Octo: list PRs' })
    vim.keymap.set('n', '<leader>Gpc', '<cmd>Octo pr changes<cr>', { desc = 'Octo: Show all PR changes (diff hunks)' })
    vim.keymap.set('n', '<leader>Gpc', '<cmd>Octo pr checks<cr>', { desc = 'Octo: Show the status of all checks run on the PR' })
    vim.keymap.set('n', '<leader>Gpr', '<cmd>Octo pr reload<cr>', { desc = 'Octo: Reload PR' })
    vim.keymap.set('n', '<leader>GR', '<cmd>Octo reaction<cr>', { desc = 'Octo: Add reaction' })
    vim.keymap.set('n', '<leader>Grs', '<cmd>Octo review start<cr>', { desc = 'Octo: Start review' })
    vim.keymap.set('n', '<leader>GrS', '<cmd>Octo review submit<cr>', { desc = 'Octo: Submit review' })
    vim.keymap.set('n', '<leader>Grr', '<cmd>Octo review resume<cr>', { desc = 'Octo: Resume review' })
    vim.keymap.set('n', '<leader>Grc', '<cmd>Octo review comments<cr>', { desc = 'Octo: Show pending comments' })
    vim.keymap.set('n', '<leader>GrC', '<cmd>Octo review close<cr>', { desc = 'Octo: Close the review window and return to the PR' })
    vim.keymap.set('n', '<leader>Gc', '<cmd>Octo comment add<cr>', { desc = 'Octo: Add a new comment' })
  end,
  cond = function()
    vim.fn.system 'which gh'
    if vim.v.shell_error ~= 0 then
      return false
    end
    return true
  end,
}
