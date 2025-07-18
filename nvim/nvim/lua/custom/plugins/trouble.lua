return {
  'folke/trouble.nvim',
  opts = {
    modes = {
      errorsonly = {
        mode = 'diagnostics', -- inherit from diagnostics mode
        filter = {
          any = {
            buf = 0, -- current buffer
            {
              severity = vim.diagnostic.severity.ERROR, -- errors only
              -- limit to files in the current project
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
