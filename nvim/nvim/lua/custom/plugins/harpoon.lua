return {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon add' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon toggle_quick_menu' })

    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon select file 1' })
    vim.keymap.set('n', '<leader>ht', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon select file 2' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon select file 3' })
    vim.keymap.set('n', '<leader>hs', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon select file 4' })
    vim.keymap.set('n', '<M-S>p', function()
      harpoon:list():prev()
    end, { desc = 'Toggle previous buffers stored within Harpoon list' })
    vim.keymap.set('n', '<M-S>n', function()
      harpoon:list():next()
    end, { desc = 'Toggle next buffers stored within Harpoon list' })
  end,
}
