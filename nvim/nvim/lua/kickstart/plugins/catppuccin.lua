return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --
    --
    local textcolor = '#f9e2af'
    local stringcolor = '#a6adc8'
    local commentcolor = '#f5c2e7'
    local numbercolor = '#89b4fa'
    local creamtextcolor = '#d4c7a2'
    local conditioncolor = '#eba0ac'
    local cyberyellow = '#fadf2d'
    local cybergreen = '#d8fa3c'
    local cyberpink = '#fe1492'
    local cyberblue = '#042ac1'
    local cybertiel = '#01fffe'
    local cyberligthblue = '#97cafa'
    require('catppuccin').setup {
      color_overrides = {
        mocha = {
          base = '#000000',
          mantle = '#000000',
          crust = '#000000',
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            ['@parameter'] = { fg = creamtextcolor },
            ['@constant'] = { fg = creamtextcolor },
            ['@text'] = { fg = creamtextcolor },
            ['@field'] = { fg = creamtextcolor },
            ['@property'] = { fg = creamtextcolor },
            ['@constructor'] = { fg = creamtextcolor },
            ['@module'] = { fg = creamtextcolor },
            ['@variable.parameter'] = { fg = creamtextcolor },
            ['@variable.member'] = { fg = creamtextcolor },
            ['@variable'] = { fg = creamtextcolor },
            ['@operator'] = { fg = creamtextcolor },
            ['@function'] = { fg = creamtextcolor },
            ['@function.method'] = { fg = creamtextcolor },
            ['@function.method.call'] = { fg = creamtextcolor },
            ['@type'] = { fg = creamtextcolor },
            ['@type.builtin'] = { fg = creamtextcolor },
            ['@keyword'] = { fg = creamtextcolor },
            ['@keyword.function'] = { fg = creamtextcolor },
            ['@keyword.operator'] = { fg = creamtextcolor },
            ['@keyword.exception'] = { fg = creamtextcolor },
            ['@keyword.import'] = { fg = creamtextcolor },
            ['@keyword.type'] = { fg = creamtextcolor },
            ['@keyword.conditional'] = { fg = conditioncolor },
            -- ['@keyword.conditional'] = { fg = '#cba6f7' },
            ['@keyword.repeat'] = { fg = conditioncolor },
            -- ['@keyword.repeat'] = { fg = '#cba6f7' },
            ['@keyword.return'] = { fg = conditioncolor },
            -- ['@keyword.return'] = { fg = '#c2eebd' },
            ['@function.call'] = { fg = creamtextcolor },
            ['@function.builtin'] = { fg = creamtextcolor },
            ['@boolean'] = { fg = creamtextcolor },
            ['@number'] = { fg = numbercolor },
            ['@constant.builtin'] = { fg = creamtextcolor },
            ['@string'] = { fg = stringcolor },
            ['@comment'] = { fg = commentcolor },
            ['@comment.documentation'] = { fg = commentcolor },
            -- ['@spell'] = { fg = '#ebbaef' },
            -- Function = { fg = textcolor },
            -- Keyword = { fg = textcolor },
            -- Character = { fg = textcolor },
            -- Constant = { fg = textcolor },
            -- Special = { fg = textcolor },
            -- Operator = { fg = textcolor },
            -- Identifier = { fg = textcolor },
            -- Type = { fg = textcolor },
            -- Structure = { fg = textcolor },
            -- Label = { fg = textcolor },
            -- Exception = { fg = textcolor },
            -- PreProc = { fg = textcolor },
            -- Include = { fg = textcolor },
            -- Macro = { fg = textcolor },
            -- StorageClass = { fg = textcolor },
            -- Boolean = { fg = '#fcceb2' },
            -- Number = { fg = '#fcceb2' },
            -- String = { fg = '#ebbaef' },
            -- Comment = { fg = '#b4befe' },
            -- Conditional = { fg = '#bac2de' },
            -- Repeat = { fg = '#bac2de' },
          }
        end,
      },
    }
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
