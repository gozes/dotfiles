return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  opts = {
    enabled = true,
    file_types = { 'markdown', 'quarto', 'telekasten' },
  },
}
