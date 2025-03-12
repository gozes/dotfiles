return {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  branch = 'regexp',
  opts = {
    name = { 'venv', '.venv' },
    dap_enabled = true,
    -- Your options go here
    -- name = "venv",
    auto_refresh = true,
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>pvs', '<cmd>VenvSelect<cr>', desc = 'Python: Select venv' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>pvc', '<cmd>VenvSelectCached<cr>', desc = 'Python: Select venv from cache' },
  },
}
