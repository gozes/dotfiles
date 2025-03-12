return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      watch_for_changes = true,
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
      },
      win_options = {
        wrap = true,
      },
      keymaps = {
        ['<C-c>'] = false,
        [';h'] = { 'actions.select', opts = { horizontal = true }, desc = 'Oil: Open the entry in a horizontal split' },
        ['<C-l>'] = false,
        [';r'] = 'actions.refresh',
        ['q'] = 'actions.close',
      },
    }
    vim.keymap.set('n', '-', require('oil').toggle_float, { desc = 'Oil: Open parent directory' })
    vim.keymap.set('n', '<leader>x', require('oil').toggle_float, { desc = 'Oil: Open parent directory' })
  end,
}
