return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  opts = {
    enabled = true,
    render_modes = { 'n', 'c', 't' },
    file_types = { 'markdown', 'quarto', 'telekasten', 'copilot-chat', 'Avante' },
  },
}
