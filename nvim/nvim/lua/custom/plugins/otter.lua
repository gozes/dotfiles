return {
  'jmbuhr/otter.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = { 'toml' },
      group = vim.api.nvim_create_augroup('EmbedToml', {}),
      callback = function()
        require('otter').activate()
      end,
    })
  end,
}
