local strudel = require 'strudel'

vim.keymap.set('n', '<leader>.l', strudel.launch, { desc = 'Launch Strudel', buffer = true })
vim.keymap.set('n', '<leader>.q', strudel.quit, { desc = 'Quit Strudel', buffer = true })
vim.keymap.set('n', '<leader>.t', strudel.toggle, { desc = 'Strudel Toggle Play/Stop', buffer = true })
vim.keymap.set('n', '<leader>.u', strudel.update, { desc = 'Strudel Update', buffer = true })
vim.keymap.set('n', '<leader>.s', strudel.stop, { desc = 'Strudel Stop Playback', buffer = true })
vim.keymap.set('n', '<leader>.b', strudel.set_buffer, { desc = 'Strudel set current buffer', buffer = true })
vim.keymap.set('n', '<leader>.x', strudel.execute, { desc = 'Strudel set current buffer and update', buffer = true })
