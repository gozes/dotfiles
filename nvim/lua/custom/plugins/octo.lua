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
    vim.keymap.set('n', '<leader>O', '<cmd>Octo<cr>', { desc = 'Octo' })
  end,
  cond = function()
    vim.fn.system 'which gh'
    if vim.v.shell_error ~= 0 then
      return false
    end
    return true
  end,
}
