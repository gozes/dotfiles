vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

local lspkind = require "lspkind"
lspkind.init()

local cmp = require "cmp"


cmp.setup({
    mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<cr>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<c-q>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ["<c-space>"] = cmp.mapping.complete(),
    ["<Tab>"] = function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end,
    ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end,

    },
    sources = {

    { name = "nvim_lua" },

    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 3 },
  },
   formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        name = '[spell]',
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

