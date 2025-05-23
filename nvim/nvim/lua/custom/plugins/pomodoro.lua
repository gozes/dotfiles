return {
  'epwalsh/pomo.nvim',
  version = '*', -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    'rcarriga/nvim-notify',
  },
  keys = {
    { '<leader>p1', '<cmd>TimerSession p1<CR>', desc = 'Pomo: 25/5' },
    { '<leader>p2', '<cmd>TimerSession p2<CR>', desc = 'Pomo: 2x 25/5' },
    { '<leader>p5', '<cmd>TimerSession p50<CR>', desc = 'Pomo: 50m' },
    { '<leader>pew', '<cmd>TimerSession ew<CR>', desc = 'Pomo: Exploratory Writing(10m)' },
    { '<leader>peg', '<cmd>TimerSession eg<CR>', desc = 'Pomo: Evergreen Note(25m)' },
  },
  opts = {
    sessions = {
      ew = {
        { name = 'Exploratory Writing', duration = '10m' },
      },
      eg = {
        { name = 'Write Evergreen Note', duration = '15m' },
        { name = 'Read and Think about next step', duration = '5m' },
        { name = 'Refactor Note', duration = '5m' },
      },
      p1 = {
        { name = 'Focus', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
      },
      p2 = {
        { name = 'Focus', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
        { name = 'Focus', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
      },
      p50 = {
        { name = 'Focus', duration = '50m' },
        { name = 'Short Break', duration = '5m' },
      },
    },
  },
}
