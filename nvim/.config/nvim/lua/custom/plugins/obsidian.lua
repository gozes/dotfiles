return {
  'epwalsh/obsidian.nvim',
  enabled = false,
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  keys = {
    { ';oo', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian: Quick Switch to Note' },
    { ';os', '<cmd>ObsidianSearch<cr>', desc = 'Obsidian: Search' },
    { ';ot', '<cmd>ObsidianToday<cr>', desc = 'Obsidian: Today note' },
    { ';oT', '<cmd>ObsidianTemplate<cr>', desc = 'Obsidian: Insert Template' },
    { ';ol', '<cmd>ObsidianLinks<cr>', desc = 'Obsidian: Links' },
    { ';obl', '<cmd>ObsidianBacklinks<cr>', desc = 'Obsidian: BackLinks' },
    { ';on', '<cmd>ObsidianNewFromTemplate', desc = 'Obsidian: Create New Note' },
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'hrsh7th/nvim-cmp',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d',
    },
    mappings = {
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
    daily_notes = {
      folder = 'Daily',
      date_format = '%Y-%m-%d',
    },
    workspaces = {
      {
        name = 'notes',
        path = '~/Documents/Obsidian/notes',
      },
    },

    -- see below for full list of options 👇
  },
}
