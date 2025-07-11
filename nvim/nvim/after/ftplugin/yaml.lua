vim.opt_local.cursorcolumn = true
vim.keymap.set('n', ',s', '<cmd>YAMLSnacks<cr>', { desc = 'YAML: Search', buffer = true })
vim.keymap.set('n', ',yv', '<cmd>YAMLYankValue<cr>', { desc = 'YAML: Yank value full path', buffer = true })
vim.keymap.set('n', ',yk', '<cmd>YAMLYankKey<cr>', { desc = 'YAML: Yank key full path', buffer = true })
vim.keymap.set('n', ',v', '<cmd>YAMLView<cr>', { desc = 'YAML: View', buffer = true })
