return {
  'mrjones2014/smart-splits.nvim',
  opts = {
    default_amount = 5,
  },
  keys = {
    {
      '<M-S>h',
      function()
        require('smart-splits').resize_left()
      end,
      desc = 'Smart Slplit: Resize Left',
    },
    {
      '<M-S>j',
      function()
        require('smart-splits').resize_down()
      end,
      desc = 'Smart Slplit: Resize Down',
    },
    {
      '<M-S>k',
      function()
        require('smart-splits').resize_up()
      end,
      desc = 'Smart Slplit: Resize Up',
    },
    {
      '<M-S>l',
      function()
        require('smart-splits').resize_right()
      end,
      desc = 'Smart Slplit: Resize Right',
    },
    {
      '<C-h>',
      function()
        require('smart-splits').move_cursor_left()
      end,
      desc = 'Smart Slplit: Move Left',
    },
    {
      '<C-j>',
      function()
        require('smart-splits').move_cursor_down()
      end,
      desc = 'Smart Slplit: Move Down',
    },
    {
      '<C-k>',
      function()
        require('smart-splits').move_cursor_up()
      end,
      desc = 'Smart Slplit: Move Up',
    },
    {
      '<C-l>',
      function()
        require('smart-splits').move_cursor_right()
      end,
      desc = 'Smart Slplit: Move Right',
    },
    {
      '<C-;>',
      function()
        require('smart-splits').move_cursor_previous()
      end,
      desc = 'Smart Slplit: Move to Previous',
    },
    {
      '<M-x>h',
      function()
        require('smart-splits').swap_buf_left()
      end,
      desc = 'Smart Slplit: Swap Left',
    },
    {
      '<M-x>j',
      function()
        require('smart-splits').swap_buf_down()
      end,
      desc = 'Smart Slplit: Swap Down',
    },
    {
      '<M-x>k',
      function()
        require('smart-splits').swap_buf_up()
      end,
      desc = 'Smart Slplit: Swap Up',
    },
    {
      '<M-x>l',
      function()
        require('smart-splits').swap_buf_right()
      end,
      desc = 'Smart Slplit: Swap Right',
    },
  },
}
