return {
  {
    'ldelossa/litee.nvim',
    event = 'VeryLazy',
    opts = {
      notify = { enabled = false },
      panel = {
        orientation = 'bottom',
        panel_size = 10,
      },
    },
    config = function(_, opts)
      require('litee.lib').setup(opts)
    end,
  },

  {
    'ldelossa/litee-calltree.nvim',
    dependencies = 'ldelossa/litee.nvim',
    event = 'VeryLazy',
    opts = {
      on_open = 'panel',
      map_resize_keys = false,
    },
    config = function(_, opts)
      require('litee.calltree').setup(opts)
      vim.keymap.set('n', ';cic', function()
        vim.lsp.buf.incoming_calls()
      end, { desc = 'Show incomming call to func' })
      vim.keymap.set('n', ';coc', function()
        vim.lsp.buf.outgoing_calls()
      end, { desc = 'Show outgoing call to func' })
    end,
  },
}
