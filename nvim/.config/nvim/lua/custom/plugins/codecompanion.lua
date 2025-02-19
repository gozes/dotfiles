local propms = {
  ['AWS Docs'] = {
    strategy = 'chat',
    description = 'Get AWS docs with CF exmaples',
    opts = {
      modes = { 'n' },
      short_name = 'awsdocs',
      user_prompt = true,
    },
    prompts = {
      role = 'user',
      content = function(context)
        local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
        return string.format(
          [[
        <user_prompt>
        When replying to the question follow this steps.
        1. Only use the Most up to date official AWS documentation or offical aws github repo
        2. Ensure that you have look at the code in buffre %d and the code below
        3. When replying make sure that the answer incueld a solution using aws cloudformation

        ```%s
          %s
        ```
        </user_prompt>
        ]],
          context.bufnr,
          context.filetype,
          code
        )
      end,
    },
  },
}
return {
  'olimorris/codecompanion.nvim',
  keys = {
    {
      'n',
      '<M-a>i',
      ':CodeCompanion #buffer ',
      desc = 'CodeCompanion: Inline chat',
    },
    {
      'v',
      '<M-a>i',
      ":'<,'>CodeCompanion",
      desc = 'CodeCompanion: Visual Inline chat',
    },
    {
      '<M-a>c',
      '<cmd>CodeCompanionChat Toggle<cr>',
      desc = 'CodeCompanion: Toggel Chat',
    },
    {
      '<M-a>p',
      '<cmd>CodeCompanionActions<cr>',
      desc = 'CodeCompanion: Action Palette',
    },
  },
  opts = {
    prompt_library = propms,
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          name = 'copilot-claude',
          schema = {
            models = {
              default = 'claude-3.5-sonnet',
            },
          },
        })
      end,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
