--vim.keymap.set('i', '[[', '<cmd>Telekasten insert_link<CR>')
vim.opt_local.textwidth = 80
vim.keymap.set('n', '<leader>DD', ':InsertDate<CR>', { noremap = true, silent = true, desc = 'Insert Date' })
vim.keymap.set('n', '<leader>DT', ':InsertTime<CR>', { noremap = true, silent = true, desc = 'insert Time' })
vim.keymap.set('n', '<leader>DDT', ':InsertDateTime<CR>', { noremap = true, silent = true, desc = 'Insert DateTime' })
