return {
  {
    'nvim-neotest/neotest',
    enabled = false,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      { 'fredrikaverpil/neotest-golang', version = '*' }, -- Installation
      { 'nvim-neotest/neotest-python' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-golang', -- Registration
          require('neotest-python').setup {
            python = { '.venv/bin/python', 'venv/bin/python' },
          },
        },
      }
    end,
    keys = {
      {
        '<leader>tn',
        function()
          require('neotest').run.run()
        end,
        desc = 'Neotest: run nearest test',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Neotest: run file test',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { vim.fn.expand '%', strategy = 'dap' }
        end,
        desc = 'Neotest: run file test with debug',
      },
      {
        '<leader>tw',
        function()
          require('neotest').watch.toggle(vim.fn.expand '%')
        end,
        desc = 'Neotest: start/stop watching test for file',
      },
    },
  },
}
