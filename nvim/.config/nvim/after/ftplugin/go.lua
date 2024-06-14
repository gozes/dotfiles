vim.keymap.set('n', ',a', '<cmd>GoAlt<cr>', { desc = 'Golang: Alternate between code and test file' })
vim.keymap.set('n', ',ta', '<cmd>GoAddTest<cr>', { desc = 'Golang: Add test for Func' })
vim.keymap.set('n', ',tf', '<cmd>GoTestFunc<cr>', { desc = 'Golang: Run test for current func' })
vim.keymap.set('n', ',tF', '<cmd>GoTestFile<cr>', { desc = 'Golang: Run test for current file' })
vim.keymap.set('n', ',ts', '<cmd>GoTestSubCase<cr>', { desc = 'Golang: Run test subcase' })
vim.keymap.set('n', ',dt', '<cmd>GoDebug -t<cr>', { desc = 'Golang: Debug test' })
vim.keymap.set('n', ',db', '<cmd>GoBreakToggle<cr>', { desc = 'Golang: Debug Toggle Brake Point' })
vim.keymap.set('n', ',dr', '<cmd>GoDebug -R<cr>', { desc = 'Golang: Debug Restart' })
vim.keymap.set('n', ',if', '<cmd>GoIfErr<cr>', { desc = 'Golang: Add if err' })
vim.keymap.set('n', ',ip', '<cmd>GoImports<cr>', { desc = 'Golang: Run GoImports' })
vim.keymap.set('n', ',q', '<cmd>ccl<cr>', { desc = 'Golang: Close quickfix list' })
vim.keymap.set('n', ',j', '<cmd>cnext<cr>', { desc = 'Golang: go to next quickfix item' })
vim.keymap.set('n', ',k', '<cmd>cprev<cr>', { desc = 'Golang: go to previous quickfix item' })
vim.keymap.set('n', ',cl', '<cmd>GoCodeLenAct<cr>', { desc = 'Golang: Show codelens picker' })
vim.keymap.set('n', ',ca', '<cmd>GoCodeAction<cr>', { desc = 'Golang: Show codeAction picker' })
vim.keymap.set('n', ',h', '<cmd>GoToggleInlay<cr>', { desc = 'Golang: Toggle Inlay hint' })

vim.filetype.add {
  extension = {
    gotmpl = 'gotexttmpl',
    gotexttmpl = 'gotexttmpl',
    gohtml = 'gohtmltmpl',
  },
}
