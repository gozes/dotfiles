return {
  'zk-org/zk-nvim',
  keys = {
    {
      '<leader>zg',
      function()
        require('zk.commands').get 'ZkNotes' { match = { vim.fn.input 'Search: ' } }
      end,
      desc = 'Notes: Search Notes',
    },
    {
      '<leader>zf',
      function()
        require('zk.commands').get 'ZkNotes' { excludeHrefs = { 'daily' }, tags = { '-backlog' } }
      end,
      desc = 'Notes: Find Note',
    },
    { '<leader>zF', '<cmd>ZkNotes<CR>', desc = 'Notes: Find In All' },
    {
      '<leader>zB',
      function()
        require('zk.commands').get 'ZkNotes' { excludeHrefs = { 'daily' }, tags = { 'backlog' } }
      end,
      desc = 'Notes: Backlog',
    },
    {
      '<leader>zi',
      function()
        require('zk.commands').get 'ZkNotes' { excludeHrefs = { 'daily' }, tags = { 'inbox' } }
      end,
      desc = 'Notes: Inbox',
    },
    { '<leader>zI', '<cmd>ZkIndex<CR>', desc = 'Notes: Index' },
    {
      '<leader>zem',
      function()
        require('zk.commands').get 'ZkNewFromContentSelection' { title = vim.fn.input 'Title: ', group = 'main' }
      end,
      mode = 'v',
      desc = 'Notes: Extract Selection to Main Note',
    },
    {
      '<leader>zer',
      function()
        require('zk.commands').get 'ZkNewFromContentSelection' { title = vim.fn.input 'Title: ', group = 'ref' }
      end,
      mode = 'v',
      desc = 'Notes: Extract Selection to Ref Note',
    },
    { '<leader>zR', '<cmd>ZkRelated<CR>', desc = 'Notes: Related' },
    { '<leader>zuf', '<cmd>ZkUnlinkedMentionFrom<CR>', desc = 'Notes: Mention From' },
    { '<leader>zut', '<cmd>ZkUnlinkedMentionTo<CR>', desc = 'Notes: Mention To' },
    {
      '<leader>zd',
      function()
        require('zk.commands').get 'ZkNew' { group = 'daily', dir = 'daily' }
      end,
      desc = 'Notes: Today Note',
    },
    {
      '<leader>zW',
      function()
        require('zk.commands').get 'ZkNew' { group = 'weekly', dir = 'weekly' }
      end,
      desc = 'Notes: Create Weekly Note',
    },
    { '<leader>zl', '<cmd>ZkLinks<CR>', desc = 'Notes: Links' },
    { '<leader>zb', '<cmd>ZkBacklinks<CR>', desc = 'Notes: Backlinks' },
    {
      '<leader>zn',
      function()
        require('zk.commands').get 'ZkNew' { title = vim.fn.input 'Title: ' }
      end,
      desc = 'Notes: New Note',
    },
    { '<leader>zM', '<cmd>ZkMention<CR>', desc = 'Notes: Mentions' },
    {
      '<leader>zw',
      function()
        require('zk.commands').get 'ZkNew' { group = 'work', title = vim.fn.input 'Title: ', dir = 'work' }
      end,
      desc = 'Notes: New Work Note',
    },
    { '<leader>zt', '<cmd>ZkTags<CR>', desc = 'Notes: Tags' },
    { '<leader>zT', '<cmd>ZkTagless<CR>', desc = 'Notes: Tagless' },
    { '<leader>zo', '<cmd>ZkOrphans<CR>', desc = 'Notes: Orphans' },
    {
      '<leader>zc',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Notes: Unload and close curent note',
    },
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
    commands.add('ZkOrphans', make_edit_fn({ orphan = true, excludeHrefs = { 'daily' } }, { title = 'Zk Orphans' }))
    commands.add('ZkTagless', make_edit_fn({ tagless = true, excludeHrefs = { 'daily' } }, { title = 'Zk Tagless' }))
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
