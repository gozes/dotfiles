return {
  ---@module 'python'
  {
    'joshzcold/python.nvim',
    event = 'VeryLazy',
    ft = 'python',
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      { 'mfussenegger/nvim-dap-python' },
      { 'neovim/nvim-lspconfig' },
      { 'L3MON4D3/LuaSnip' },
      { 'nvim-neotest/neotest' },
      { 'nvim-neotest/neotest-python' },
    },
    opts = { ---@diagnostic disable-line: missing-fields`
    },
    -- Optional suggested keymaps
    keys = {
      { '<leader>,v', '<cmd>Python venv pick<cr>', desc = 'python.nvim: pick venv' },
      { '<leader>,i', '<cmd>Python venv install<cr>', desc = 'python.nvim: python venv install' },
      { '<leader>,d', '<cmd>Python dap<cr>', desc = 'python.nvim: python run debug program' },

      -- Test Actions
      { '<leader>,tt', '<cmd>Python test test<cr>', desc = 'python.nvim: python run test suite' },
      { '<leader>,tm', '<cmd>Python test test_method<cr>', desc = 'python.nvim: python run test method' },
      { '<leader>,tf', '<cmd>Python test test_file<cr>', desc = 'python.nvim: python run test file' },
      { '<leader>,tdd', '<cmd>Python test test_debug<cr>', desc = 'python.nvim: run test suite in debug mode.' },
      {
        '<leader>,tdm',
        '<cmd>Python test test_method_debug<cr>',
        desc = 'python.nvim: run test method in debug mode.',
      },
      { '<leader>,tdf', '<cmd>Python test_file_debug<cr>', desc = 'python.nvim: run test file in debug mode.' },

      -- VEnv Actions
      { '<leader>,ed', '<cmd>Python venv delete_select<cr>', desc = 'python.nvim: select and delete a known venv.' },
      { '<leader>,eD', '<cmd>Python venv delete<cr>', desc = 'python.nvim: delete current venv set.' },

      -- Language Actions
      { '<leader>,pe', '<cmd>Python treesitter toggle_enumerate<cr>', desc = 'python.nvim: turn list into enumerate' },
      {
        '<leader>,w',
        '<cmd>Python treesitter wrap_cursor<cr>',
        desc = 'python.nvim: wrap treesitter identifier with pattern',
      },
      {
        '<leader>,w',
        mode = 'v',
        ':Python treesitter wrap_cursor<cr>',
        desc = 'python.nvim: wrap treesitter identifier with pattern',
      },
    },
  },
}
