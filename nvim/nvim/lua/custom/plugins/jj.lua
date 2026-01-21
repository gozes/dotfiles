return {
  'nicolasgb/jj.nvim',
  keys = {
    {
      '<leader>jl',
      '<cmd>J log<cr>',
      desc = 'jj: log',
    },
    {
      '<leader>jt',
      '<cmd>J tug<cr>',
      desc = 'jj: tug',
    },
    {
      '<leader>js',
      '<cmd>J status<cr>',
      desc = 'jj: status',
    },
  },
  version = '*', -- Use latest stable release
  -- Or from the main branch (uncomment the branch line and comment the version line)
  -- branch = "main",
  config = function()
    require('jj').setup {}
  end,
}
