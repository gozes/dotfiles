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
    { '<leader>p1', '<cmd>TimerSession p1<CR>', desc = 'Pomo: One Round' },
    { '<leader>p2', '<cmd>TimerSession p2<CR>', desc = 'Pomo: Two Rounds' },
  },
  opts = {
    sessions = {
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
    },
  },
}
