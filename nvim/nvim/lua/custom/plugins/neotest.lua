return {
  'nvim-neotest/neotest',
  enabled = true,
  event = 'VeryLazy',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
  },
  keys = {
    {
      '<leader>,tt',
      function()
        require('neotest').run.run()
      end,
      desc = 'NeoTest: Run the nearest test',
    },
    {
      '<leader>,tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'NeoTest: Run the file tests',
    },
    {
      '<leader>,to',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'NeoTest: Output Pannel',
    },
    {
      '<leader>,tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand '%')
      end,
      desc = 'NeoTest: Watch curent file',
    },
    {
      '<leader>,tw',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'NeoTest: Summary',
    },
    {
      '<leader>,tjp',
      function()
        require('neotest').jump.prev { status = 'failed' }
      end,
      desc = 'NeoTest: Jump to prev fail test',
    },
    {
      '<leader>,tjn',
      function()
        require('neotest').jump.next { status = 'failed' }
      end,
      desc = 'NeoTest: Jump to next fail test',
    },
  },
  opts = {
    adapters = {
      require 'neotest-python',
      require 'neotest-gleam-unitest',
    },
  },
}
