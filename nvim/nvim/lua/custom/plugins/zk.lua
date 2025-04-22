return {
  'zk-org/zk-nvim',
  keys = {
    {
      '<leader>zs',
      function()
        require('zk.commands').get 'ZkNew' { match = { vim.fn.input 'Search: ' } }
      end,
      desc = 'Notes: Search Notes',
    },
    {
      '<leader>zf',
      function()
        require('zk.commands').get 'ZkNotes' { excludeHrefs = { 'daily' }, tags = { '-hold' } }
      end,
      desc = 'Notes: Find Note',
    },
    {
      '<leader>zi',
      function()
        require('zk.commands').get 'ZkNotes' { excludeHrefs = { 'daily' }, tags = { 'inbox -hold' } }
      end,
      desc = 'Notes: Inbox',
    },
    { '<leader>zF', '<cmd>ZkNotes<CR>', desc = 'Notes: Find In All' },
    {
      '<leader>zr',
      function()
        require('zk.commands').get 'ZkNewFromContentSelection' { title = vim.fn.input 'Title: ', group = 'main' }
      end,
      mode = 'v',
      desc = 'Notes: Refactor Selection to New Note',
    },
    { '<leader>zR', '<cmd>ZkRelated<CR>', desc = 'Notes: Related' },
    { '<leader>zuf', '<cmd>ZkUnlinkedMentionFrom<CR>', desc = 'Notes: Mention From' },
    { '<leader>zut', '<cmd>ZkUnlinkedMentionTo<CR>', desc = 'Notes: Mention To' },
    {
      '<leader>zd',
      function()
        require('zk.commands').get 'ZkNew' { group = 'daily' }
      end,
      desc = 'Notes: Today Note',
    },
    { '<leader>zl', '<cmd>ZkLinks<CR>', desc = 'Notes: Links' },
    { '<leader>zb', '<cmd>ZkBacklinks<CR>', desc = 'Notes: Backlinks' },
    {
      '<leader>zn',
      function()
        require('zk.commands').get 'ZkNew' { group = 'ref', title = vim.fn.input 'Title: ' }
      end,
      desc = 'Notes: New Ref Note',
    },
    {
      '<leader>zm',
      function()
        require('zk.commands').get 'ZkNew' { group = 'main', title = vim.fn.input 'Title: ' }
      end,
      desc = 'Notes: New Main Note',
    },
    { '<leader>zM', '<cmd>ZkMention<CR>', desc = 'Notes: Mentions' },
    {
      '<leader>zw',
      function()
        require('zk.commands').get 'ZkNew' { group = 'work', title = vim.fn.input 'Title: ' }
      end,
      desc = 'Notes: New Work Note',
    },
    { '<leader>zt', '<cmd>ZkTags<CR>', desc = 'Notes: Tags' },
    { '<leader>zT', '<cmd>ZkTagless<CR>', desc = 'Notes: Tagless' },
    { '<leader>zo', '<cmd>ZkOrphans<CR>', desc = 'Notes: Orphans' },
  },
  config = function()
    local zk = require 'zk'
    local commands = require 'zk.commands'
    local function make_edit_fn(defaults, picker_options)
      return function(options)
        options = vim.tbl_extend('force', defaults, options or {})
        zk.edit(options, picker_options)
      end
    end
    commands.add('ZkMention', function(options)
      options = vim.tbl_extend('force', { mention = { vim.api.nvim_buf_get_name(0) } }, options or {})
      zk.edit(options, { title = 'Zk Mentions' })
    end)
    commands.add('ZkRelated', function(options)
      options = vim.tbl_extend('force', { related = { vim.api.nvim_buf_get_name(0) } }, options or {})
      zk.edit(options, { title = 'Zk Related' })
    end)
    commands.add('ZkUnlinkedMentionFrom', function(options)
      local note = vim.api.nvim_buf_get_name(0)
      options = vim.tbl_extend('force', { mentionedBy = { note }, linkedBy = { note } }, options or {})
      zk.edit(options, { title = 'Zk Unlinked Mention From' })
    end)
    commands.add('ZkUnlinkedMentionTo', function(options)
      local note = vim.api.nvim_buf_get_name(0)
      options = vim.tbl_extend('force', { mention = { note }, linkTo = { note } }, options or {})
      zk.edit(options, { title = 'Zk Unlinked Mention To' })
    end)
    commands.add('ZkOrphans', make_edit_fn({ orphan = true }, { title = 'Zk Orphans' }))
    commands.add('ZkTagless', make_edit_fn({ tagless = true }, { title = 'Zk Tagless' }))
    require('zk').setup {
      picker = 'snacks_picker',
      picker_options = {
        snacks_picker = {
          layout = {
            preset = 'ivy_split',
          },
        },
      },
    }
  end,
}
