return {
  'NickvanDyke/opencode.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `toggle()`.
    { 'folke/snacks.nvim', opts = { input = {}, picker = {} } },
  },
  config = function()
    vim.g.opencode_opts = {
      port = 6660,
      -- Your configuration, if any — see `lua/opencode/config.lua`
    }

    -- Required for `vim.g.opencode_opts.auto_reload`
    vim.opt.autoread = true

    -- Recommended/example keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = 'OpenCode:Ask about this' })
    vim.keymap.set({ 'n', 'x' }, '<leader>o+', function()
      require('opencode').prompt '@buffer'
    end, { desc = 'OpenCode:Add this' })
    vim.keymap.set({ 'n', 'x' }, '<leader>os', function()
      require('opencode').select()
    end, { desc = 'OpenCode:Select prompt' })
    vim.keymap.set('n', '<leader>ot', function()
      require('opencode').toggle()
    end, { desc = 'OpenCode:Toggle embedded' })
    vim.keymap.set('n', '<leader>on', function()
      require('opencode').command 'session_new'
    end, { desc = 'OpenCode:New session' })
    vim.keymap.set('n', '<leader>oi', function()
      require('opencode').command 'session_interrupt'
    end, { desc = 'OpenCode:Interrupt session' })
    vim.keymap.set('n', '<leader>oA', function()
      require('opencode').command 'agent_cycle'
    end, { desc = 'OpenCode:Cycle selected agent' })
    vim.keymap.set('n', '<S-C-u>', function()
      require('opencode').command 'messages_half_page_up'
    end, { desc = 'OpenCode:Messages half page up' })
    vim.keymap.set('n', '<S-C-d>', function()
      require('opencode').command 'messages_half_page_down'
    end, { desc = 'OpenCode:Messages half page down' })
  end,
}
