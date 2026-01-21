return {
  'chrisgrieser/nvim-justice',
  enabled = false,
  keys = {
    {
      '<leader>j',
      function()
        require('justice').select()
      end,
      desc = 'Run just task',
    },
    {
      '<leader>J',
      function()
        require('justice').select { justfile = '~/dotfiles/just/just/justfile' }
      end,
      desc = 'Run global just task',
    },
  },
  opts = {
    keymaps = {
      next = '<C-n>',
      prev = '<C-p>',
      runRecipeUnderCursor = '<C-y>',
    },
  },
}
