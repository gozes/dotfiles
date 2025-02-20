return {
  'mistricky/codesnap.nvim',
  enabled = false,
  build = 'make',
  keys = {
    { '<leader>cs', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'CodeSnap: Save selected code snapshot into clipboard' },
  },
  config = function()
    require('codesnap').setup {
      has_breadcrumbs = true,
      has_line_number = true,
      bg_color = '#535c68',
      watermark = '',
    }
  end,
}
