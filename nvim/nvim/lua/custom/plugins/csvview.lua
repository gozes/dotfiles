return {
  'hat0uma/csvview.nvim',
  enabled = false,
  config = function()
    require('csvview').setup {
      view = {
        display_mode = 'border',
      },
    }
  end,
}
