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
    local jbcolors = {
      Background = '#052329',
      Margin = '#183848',
      Margin_Hover = '#184d68',
      Margin_Active = '#108090',
      Cursor = '#90c090',
      Highlight = '#0010ff',
      Default = '#d0c0a0',
      Comment = '#40c040',
      String_Constant = '#40b0a0',
      Int_Constant = '#80f0e0',
      Preprocessor = '#b0ffb0',
      Ghost_Character = '#46494d',
      Paste = '#ffbb00',
      Undo = '#00ffbb',
      Highlight_Junk = '#3a0000',
      Highlight_White = '#003a3a',
      Bar = '#d8b488',
      Pop1 = '#20d0e0',
      Condition = '#FFFFFF',
      Text = '#d0b892',
      White = '#f0f0f0',
    }
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
    local jbbackgroundold = '#0C2827'
    local jbbackground = '#09262A'
    local jbtextcolorold = '#B9BCAB'
    local jbtextcolorold2 = '#B9B59D'
    local jbtextcolorold3 = '#BDBA9F'
    local jbtextcolor = '#d0b892'
    local jbstringcolor = '#77CCCB'
    local jbtypecolor = '#B1E1D1'
    local jbcommentcolor = '#5EAD38'
    local jbnumbercolorold = '#AEEAD8'
    local jbnumbercolor = '#87ffde'
    local jbconditioncolorold = '#BFD4E6'
    local jbconditioncolor = '#F7FCFF'
    local jbwhite = '#FFFFFF'
    local jbsatuslinebackground = '#D1B88A'
    local jbsatuslinetextcolor = '#142511'
    require('catppuccin').setup {
      compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
      color_overrides = {
        mocha = {
          base = jbcolors.Background,
          mantle = jbcolors.Background,
          crust = jbcolors.Background,
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            LineNr = { fg = jbcolors.Condition },
            Whitespace = { fg = jbcolors.Condition },
            MiniStatuslineModeCommand = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineModeNormal = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineModeOther = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineModeReplace = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineModeVisual = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineModeInsert = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineInactive = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineFilename = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineFileinfo = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            MiniStatuslineDevinfo = { bg = jbcolors.Bar, fg = jbcolors.Background, style = { 'bold' } },
            ['@parameter'] = { fg = jbcolors.Text },
            ['@constant'] = { fg = jbcolors.Text },
            ['@text'] = { fg = jbcolors.Text },
            ['@field'] = { fg = jbcolors.Text },
            ['@property'] = { fg = jbcolors.Text },
            ['@constructor'] = { fg = jbcolors.Text },
            ['@module'] = { fg = jbcolors.Text },
            ['@variable.parameter'] = { fg = jbcolors.Text },
            ['@variable.member'] = { fg = jbcolors.Text },
            ['@variable'] = { fg = jbcolors.Text },
            ['@operator'] = { fg = jbcolors.Text },
            ['@function'] = { fg = jbcolors.Text },
            ['@function.method'] = { fg = jbcolors.Text },
            ['@function.method.call'] = { fg = jbcolors.Text },
            ['@type'] = { fg = jbcolors.Text },
            ['@type.builtin'] = { fg = jbcolors.Text },
            ['@type.definition'] = { fg = jbcolors.Condition },
            ['@keyword'] = { fg = jbcolors.Text },
            ['@punctuation'] = { fg = jbcolors.Text },
            ['@punctuation.bracket'] = { fg = jbcolors.Text },
            ['@keyword.function'] = { fg = jbcolors.Text },
            ['@keyword.operator'] = { fg = jbcolors.Text },
            ['@keyword.exception'] = { fg = jbcolors.Text },
            ['@keyword.import'] = { fg = jbcolors.Text },
            ['@keyword.type'] = { fg = jbcolors.Text },
            ['@keyword.conditional'] = { fg = jbcolors.Condition, style = { 'bold' } },
            ['@keyword.coroutine'] = { fg = jbcolors.Condition, style = { 'bold' } },
            ['@keyword.repeat'] = { fg = jbcolors.Condition, style = { 'bold' } },
            ['@keyword.return'] = { fg = jbcolors.Condition, style = { 'bold' } },
            ['@function.call'] = { fg = jbcolors.Text },
            ['@function.builtin'] = { fg = jbcolors.Text },
            ['@boolean'] = { fg = jbcolors.Text },
            ['@number'] = { fg = jbcolors.Int_Constant },
            ['@constant.builtin'] = { fg = jbcolors.Text },
            ['@string'] = { fg = jbcolors.String_Constant },
            ['@comment'] = { fg = jbcolors.Comment },
            ['@comment.documentation'] = { fg = jbcolors.Comment },
          }
        end,
      },
    }
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'

    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
