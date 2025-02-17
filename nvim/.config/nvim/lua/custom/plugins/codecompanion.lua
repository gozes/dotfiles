return {
  'olimorris/codecompanion.nvim',
  keys = {
    {
      '<M-a>',
      '',
      'CodeCompanion',
    },
    {
      '<M-a>c',
      '<cmd>CodeCompanionChat Toggle<cr>',
      'CodeCompanion: Toggel Chat',
    },
    {
      '<M-a>p',
      '<cmd>CodeCompanionActions<cr>',
      'CodeCompanion: Action Palette',
    },
  },
  opts = {
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          name = 'copilot-claude',
          schema = {
            models = {
              default = 'claude-3.5-sonnet',
            },
          },
        })
      end,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
