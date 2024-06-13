return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'go',
      'fish',
      'yaml',
      'json',
      'gomod',
      'gosum',
      'templ',
      'gotmpl',
      'gowork',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          -- You can optionally set descriptions to the mappings (used in the desc parameter of
          -- nvim_buf_set_keymap) which plugins like which-key display
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
          -- You can also use captures from other query groups like `locals.scm`
          ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
        },
      },
    },
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
