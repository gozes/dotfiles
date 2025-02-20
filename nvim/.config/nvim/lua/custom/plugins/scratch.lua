return {
  'cenk1cenk2/scratch.nvim',
  enabled = false,
  keys = {
    {
      '<leader>sp',
      function()
        require('scratch').create { cwd = false, filetype = 'md' }
      end,
      desc = 'Scratch [p]ad',
    },
  },
  opts = {},
}
