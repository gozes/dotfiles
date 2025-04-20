return {
  'zk-org/zk-nvim',
  keys = {
    { '<leader>zs', '<cmd>ZkNotes {  match = { vim.fn.input("Search: ") } }<CR>', desc = 'Notes: Search Notes' },
    { '<leader>zf', '<cmd>ZkNotes<CR>', desc = 'Notes: Find Note' },
    {
      '<leader>zr',
      function()
        require('zk.commands').get 'ZkNewFromContentSelection' { title = vim.fn.input 'Title: ', group = 'main' }
      end,
      desc = 'Notes: Refactor Selection to New Note',
    },
    { '<leader>zR', '<cmd>ZkRelated<CR>', desc = 'Notes: Related' },
    { '<leader>zd', '<cmd>ZkNew {group = "daily", }<CR>', desc = 'Notes: Today Note' },
    { '<leader>zl', '<cmd>ZkLinks<CR>', desc = 'Notes: Links' },
    { '<leader>zb', '<cmd>ZkBacklinks<CR>', desc = 'Notes: Backlinks' },
    { '<leader>zn', '<cmd>ZkNew {group = "ref",  title = vim.fn.input("Title: ")}<CR>', desc = 'Notes: Create New Ref Note' },
    { '<leader>zm', '<cmd>ZkNew {group = "main", title = vim.fn.input("Title: ")}<CR>', desc = 'Notes: Create New Main Note' },
    { '<leader>zM', '<cmd>ZkMention<CR>', desc = 'Notes: Mentions' },
    { '<leader>zw', '<cmd>ZkNew {group = "work", title = vim.fn.input("Title: ")}<CR>', desc = 'Notes: Create New Work Note' },
    { '<leader>zt', '<cmd>ZkTags<CR>', desc = 'Notes: Tags' },
  },
  config = function()
    local zk = require 'zk'
    local utils = require 'zk.util'
    local commands = require 'zk.commands'
    local function make_edit_fn(defaults, picker_options)
      return function(options)
        options = vim.tbl_extend('force', defaults, options or {})
        zk.edit(options, picker_options)
      end
    end
    commands.add(
      'ZkMention',
      make_edit_fn({
        mention = function()
          utils.get_buffer_paths()
        end,
      }, { title = 'Note: Mentions' })
    )
    commands.add(
      'ZkRelated',
      make_edit_fn({
        related = function()
          utils.get_buffer_paths()
        end,
      }, { title = 'Note: Mentions' })
    )
    require('zk').setup {
      picker = 'snacks_picker',
      picker_options = {
        snacks_picker = {
          layout = {
            preset = 'ivy',
          },
        },
      },
    }
  end,
}
