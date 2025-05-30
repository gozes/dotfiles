return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>c_', hidden = true },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>d_', hidden = true },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>h_', hidden = true },
      { '<leader>r', group = '[R]ename' },
      { '<leader>r_', hidden = true },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>t_', hidden = true },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>w_', hidden = true },
      { '<leader>z', group = 'Notes' },
      { '<leader>z_', hidden = true },
      { '<leader>g', group = 'Git' },
      { '<leader>g_', hidden = true },
      { '<leader>G', group = 'GitHub' },
      { '<leader>G_', hidden = true },
      { '<leader>p', group = 'Pomo/Python' },
      { '<leader>p_', hidden = true },
    }
    -- visual mode
    require('which-key').add {
      { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
    }
  end,
}
