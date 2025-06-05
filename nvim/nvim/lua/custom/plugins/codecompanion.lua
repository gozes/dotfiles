-- local propms = {
--   ['AWS Docs'] = {
--     strategy = 'chat',
--     description = 'Get AWS docs with CF exmaples',
--     opts = {
--       modes = { 'n' },
--       short_name = 'awsdocs',
--       user_prompt = true,
--     },
--     prompts = {
--       role = 'user',
--       content = function(context)
--         local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
--         return string.format(
--           [[
--         <user_prompt>
--         When replying to the question follow this steps.
--         1. Only use the Most up to date official AWS documentation or offical aws github repo
--         2. Ensure that you have look at the code in buffre %d and the code below
--         3. When replying make sure that the answer incueld a solution using aws cloudformation
--
--         ```%s
--           %s
--         ```
--         </user_prompt>
--         ]],
--           context.bufnr,
--           context.filetype,
--           code
--         )
--       end,
--     },
--   },
-- }
return {
  'olimorris/codecompanion.nvim',
  enabled = true,
  keys = {
    {
      '<M-a>e',
      ':CodeCompanion /buffer',
      mode = 'n',
      desc = 'CodeCompanion: Inline chat',
    },
    {
      'v',
      '<M-a>e',
      ":'<,'>CodeCompanion /buffer",
      mode = 'v',
      desc = 'CodeCompanion: Visual Inline chat',
    },
    {
      '<M-a>a',
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
    --prompt_library = propms,
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          name = 'copilot-claude',
          schema = {
            models = {
              default = 'claude-sonnet-4-20250514',
            },
          },
        })
      end,
    },
  },
  cond = function()
    vim.fn.system 'which gh'
    if vim.v.shell_error ~= 0 then
      return false
    end
    return true
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
  },
}
