return {
  'mistricky/codesnap.nvim',
  build = 'make',
  keys = {
    { '<leader>cs', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'CodeSnap: Save selected code snapshot into clipboard' },
  },
  config = function()
    require('codesnap').setup {
      has_breadcrumbs = true,
      has_line_number = true,
      bg_color = '#f5c2e7',
      watermark = '',
    }
  end,
}
