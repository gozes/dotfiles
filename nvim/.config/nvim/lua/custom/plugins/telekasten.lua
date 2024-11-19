return {
  'renerocksai/telekasten.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-media-files.nvim' },
  keys = {
    { '<leader>z', '<cmd>Telekasten panel<CR>', desc = 'Notes: Command Palette' },
    { '<leader>zf', '<cmd>Telekasten find_notes<CR>', desc = 'Notes: Find Note' },
    { '<leader>zF', '<cmd>Telekasten find_friends<CR>', desc = 'Notes: Find Friend Notes' },
    { '<leader>zr', '<cmd>Telekasten rename_note<CR>', desc = 'Notes: Rename Note' },
    { '<leader>zg', '<cmd>Telekasten search_notes<CR>', desc = 'Notes: Search Notes' },
    { '<leader>zd', '<cmd>Telekasten goto_today<CR>', desc = 'Notes: Today Note' },
    { '<leader>zz', '<cmd>Telekasten follow_link<CR>', desc = 'Notes: Follow Link' },
    { '<leader>zb', '<cmd>Telekasten show_backlinks<CR>', desc = 'Notes: Show Backlinks' },
    { '<leader>zn', '<cmd>Telekasten new_note<CR>', desc = 'Notes: New Note' },
    { '<leader>zI', '<cmd>Telekasten insert_img_link<CR>', desc = 'Notes: Insert Image Link' },
  },
  config = function()
    require('telekasten').setup {
      extension = '.md',
      image_link_style = 'wiki',
      image_subdir = vim.fn.expand '~/notes/images',
      home = vim.fn.expand '~/notes', -- Put the name of your notes directory here
      dailies = vim.fn.expand '~/notes/Daily', -- Put the name of your notes directory here
      follow_url_fallback = "call jobstart('firefox --new-window {{url}}')",
    }
    require('telescope').load_extension 'media_files'
  end,
}
