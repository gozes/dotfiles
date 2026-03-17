return {
  'nvim-neotest/neotest',
  enabled = false,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
  },
  opts = {
    adapters = {
      require 'neotest-python',
    },
  },
}
