return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'catppuccin/nvim',
  name = 'catppuccin',
  enabled = true,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --
    --
    local textcolor = '#f9e2af'
    local blackbackground = '#000000'
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
    local jbbackground = '#0C2827'
    local jbtextcolor = '#B9BCAB'
    local jbstringcolor = '#77CCCB'
    local jbtypecolor = '#B1E1D1'
    local jbcommentcolor = '#5EAD38'
    local jbnumbercolor = '#AEEAD8'
    local jbconditioncolor = '#BFD4E6'
    require('catppuccin').setup {
      color_overrides = {
        mocha = {
          base = jbbackground,
          mantle = jbbackground,
          crust = jbbackground,
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            ['@parameter'] = { fg = jbtextcolor },
            ['@constant'] = { fg = jbtextcolor },
            ['@text'] = { fg = jbtextcolor },
            ['@field'] = { fg = jbtextcolor },
            ['@property'] = { fg = jbtextcolor },
            ['@constructor'] = { fg = jbtextcolor },
            ['@module'] = { fg = jbtextcolor },
            ['@variable.parameter'] = { fg = jbtextcolor },
            ['@variable.member'] = { fg = jbtextcolor },
            ['@variable'] = { fg = jbtextcolor },
            ['@operator'] = { fg = jbtextcolor },
            ['@function'] = { fg = jbtextcolor },
            ['@function.method'] = { fg = jbtextcolor },
            ['@function.method.call'] = { fg = jbtextcolor },
            ['@type'] = { fg = jbtextcolor },
            ['@type.builtin'] = { fg = jbtextcolor },
            ['@type.definition'] = { fg = jbtypecolor },
            ['@keyword'] = { fg = jbtextcolor },
            ['@punctuation'] = { fg = jbtextcolor },
            ['@punctuation.bracket'] = { fg = jbtextcolor },
            ['@keyword.function'] = { fg = jbtextcolor },
            ['@keyword.operator'] = { fg = jbtextcolor },
            ['@keyword.exception'] = { fg = jbtextcolor },
            ['@keyword.import'] = { fg = jbtextcolor },
            ['@keyword.type'] = { fg = jbtextcolor },
            ['@keyword.conditional'] = { fg = jbconditioncolor },
            -- ['@keyword.conditional'] = { fg = '#cba6f7' },
            ['@keyword.repeat'] = { fg = jbconditioncolor },
            -- ['@keyword.repeat'] = { fg = '#cba6f7' },
            ['@keyword.return'] = { fg = jbconditioncolor },
            -- ['@keyword.return'] = { fg = '#c2eebd' },
            ['@function.call'] = { fg = jbtextcolor },
            ['@function.builtin'] = { fg = jbtextcolor },
            ['@boolean'] = { fg = jbtextcolor },
            ['@number'] = { fg = numbercolor },
            ['@constant.builtin'] = { fg = jbtextcolor },
            ['@string'] = { fg = jbstringcolor },
            ['@comment'] = { fg = jbcommentcolor },
            ['@comment.documentation'] = { fg = jbcommentcolor },
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
