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
    local mocha = require('catppuccin.palettes').get_palette 'mocha'
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
      highlight_overrides = {
        all = function(colors)
          return {
            -- 1. VISUAL SELECTION & SEARCH (Subtle & Non-clashing)
            Visual = { bg = mocha.surface2, fg = mocha.text },
            VisualNOS = { bg = mocha.surface2 },
            Search = { bg = mocha.surface1, fg = mocha.pink, style = { 'bold' } },
            IncSearch = { bg = mocha.pink, fg = mocha.base },

            -- 2. MONOCHROMATIC BASE (Text, Variables, Operators)
            ['@variable'] = { fg = mocha.text },
            ['@variable.builtin'] = { fg = mocha.text },
            ['@variable.parameter'] = { fg = mocha.text },
            ['@variable.member'] = { fg = mocha.text },
            ['@parameter'] = { fg = mocha.text },
            ['@field'] = { fg = mocha.text },
            ['@property'] = { fg = mocha.text },
            ['@constant'] = { fg = mocha.text },
            ['@constant.builtin'] = { fg = mocha.text },
            ['@text'] = { fg = mocha.text },
            ['@operator'] = { fg = mocha.text },
            ['@punctuation'] = { fg = mocha.text },
            ['@punctuation.bracket'] = { fg = mocha.text },
            ['@punctuation.delimiter'] = { fg = mocha.text },
            ['@module'] = { fg = mocha.text },
            ['@type'] = { fg = mocha.text },
            ['@type.builtin'] = { fg = mocha.text },
            ['@type.definition'] = { fg = mocha.text },
            ['@boolean'] = { fg = mocha.text },
            ['@number'] = { fg = mocha.text },

            -- 3. SUB-PALETTE (Functions and Method Definitions)
            ['@function'] = { fg = mocha.subtext0 },
            ['@function.builtin'] = { fg = mocha.subtext0 },
            ['@function.call'] = { fg = mocha.subtext0 },
            ['@function.method'] = { fg = mocha.subtext0 },
            ['@function.method.call'] = { fg = mocha.subtext0 },
            ['@constructor'] = { fg = mocha.subtext0 },
            ['@constructor.python'] = { fg = mocha.subtext0 },

            -- 4. MUTED ELEMENTS (Comments and Strings)
            ['@string'] = { fg = mocha.surface2 },
            ['@comment'] = { fg = mocha.overlay0 },
            ['@comment.documentation'] = { fg = mocha.overlay0 },

            -- 5. PINK ACCENTS (Control Flow & Logic)
            ['@keyword.conditional'] = { fg = mocha.pink, style = { 'bold' } },
            ['@keyword.return'] = { fg = mocha.pink, style = { 'bold' } },
            ['@keyword.repeat'] = { fg = mocha.pink, style = { 'bold' } },
            ['@keyword.exception'] = { fg = mocha.pink },

            -- Neutral Keywords (Imports, etc)
            ['@keyword'] = { fg = mocha.subtext1 },
            ['@keyword.function'] = { fg = mocha.subtext1 },
            ['@keyword.import'] = { fg = mocha.subtext1 },

            -- 6. MUTED DIAGNOSTICS (Subtle Greys)
            ['DiagnosticError'] = { fg = mocha.subtext0 },
            ['DiagnosticWarn'] = { fg = mocha.overlay2 },
            ['DiagnosticFloatingInfo'] = { fg = mocha.overlay2 },
            ['@spell'] = { fg = mocha.overlay2 },
            ['DiagnosticInfo'] = { fg = mocha.overlay1 },
            ['DiagnosticHint'] = { fg = mocha.overlay0 },
            ['DiagnosticSing'] = { fg = mocha.overlay0 },
            ['DiagnosticSignInfo'] = { fg = mocha.overlay0 },
            ['DiagnosticFloatingHint'] = { fg = mocha.overlay0 },
            ['LightBulbFloatWin'] = { fg = mocha.overlay0 },
            ['DiagnosticSignHint'] = { fg = mocha.overlay2 },

            ['DiagnosticVirtualTextError'] = { fg = mocha.subtext0, style = { 'italic' } },
            ['DiagnosticVirtualTextWarn'] = { fg = mocha.overlay2, style = { 'italic' } },
            ['DiagnosticVirtualTextInfo'] = { fg = mocha.overlay2, style = { 'italic' } },
            ['DiagnosticVirtualTextHint'] = { fg = mocha.overlay2, style = { 'italic' } },
            ['DiagnosticSignError'] = { fg = mocha.subtext0 },
            ['DiagnosticSignWarn'] = { fg = mocha.overlay2 },
            ['LspDiagnosticsVirtualTextError'] = { fg = mocha.subtext0, style = { 'italic' } },
            ['LspDiagnosticsVirtualTextWarning'] = { fg = mocha.overlay2, style = { 'italic' } },
            ['LspDiagnosticsVirtualTextInfomation'] = { fg = mocha.overlay2, style = { 'italic' } },
            ['LspDiagnosticsSignError'] = { fg = mocha.subtext0 },
            ['LspDiagnosticsSignWarning'] = { fg = mocha.overlay2 },
            ['LspDiagnosticsVirtualTextHint'] = { fg = mocha.overlay2, style = { 'italic' } },
            ['DiagnosticUnderlineError'] = { sp = mocha.subtext0, style = { 'underdotted' } },
            ['DiagnosticUnderlineWarn'] = { sp = mocha.overlay2, style = { 'underdotted' } },

            -- ['@parameter'] = { fg = mocha.flamingo },
            -- ['@constant'] = { fg = mocha.flamingo },
            -- ['@text'] = { fg = mocha.flamingo },
            -- ['@field'] = { fg = mocha.flamingo },
            -- ['@property'] = { fg = mocha.flamingo },
            -- ['@constructor'] = { fg = mocha.flamingo },
            -- ['@module'] = { fg = mocha.flamingo },
            -- ['@variable.parameter'] = { fg = mocha.flamingo },
            -- ['@variable.member'] = { fg = mocha.flamingo },
            -- ['@variable'] = { fg = mocha.flamingo },
            -- ['@variable.builtin'] = { fg = mocha.flamingo },
            -- ['@constructor.python'] = { fg = mocha.flamingo },
            -- ['@operator'] = { fg = mocha.flamingo },
            -- ['@function'] = { fg = mocha.flamingo },
            -- ['@function.method'] = { fg = mocha.flamingo },
            -- ['@function.method.call'] = { fg = mocha.flamingo },
            -- ['@type'] = { fg = mocha.flamingo },
            -- ['@type.builtin'] = { fg = mocha.flamingo },
            -- ['@type.definition'] = { fg = mocha.flamingo },
            -- ['@keyword'] = { fg = mocha.flamingo },
            -- ['@punctuation'] = { fg = mocha.flamingo },
            -- ['@punctuation.bracket'] = { fg = mocha.flamingo },
            -- ['@punctuation.delimiter'] = { fg = mocha.flamingo },
            -- ['@keyword.function'] = { fg = mocha.flamingo },
            -- ['@keyword.operator'] = { fg = mocha.flamingo },
            -- ['@keyword.exception'] = { fg = mocha.flamingo },
            -- ['@keyword.import'] = { fg = mocha.flamingo },
            -- ['@keyword.type'] = { fg = mocha.flamingo },
            -- ['@keyword.conditional'] = { fg = mocha.text, style = { 'bold' } },
            -- ['@keyword.coroutine'] = { fg = mocha.text, style = { 'bold' } },
            -- ['@keyword.repeat'] = { fg = mocha.text, style = { 'bold' } },
            -- ['@keyword.return'] = { fg = mocha.text, style = { 'bold' } },
            -- ['@function.call'] = { fg = mocha.flamingo },
            -- ['@function.builtin'] = { fg = mocha.flamingo },
            -- ['@boolean'] = { fg = mocha.flamingo },
            -- ['@number'] = { fg = mocha.sapphire },
            -- ['@constant.builtin'] = { fg = mocha.flamingo },
            -- ['@string'] = { fg = mocha.blue },
            -- ['@comment'] = { fg = mocha.pink },
            -- ['@comment.documentation'] = { fg = mocha.pink },
          }
        end,
      },
    }
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'

    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}

-- require("catppuccin").setup({
--     flavour = "mocha",
--     integrations = {
--         treesitter = true,
--         native_lsp = {
--             enabled = true,
--             virtual_text = {
--                 errors = { "italic" },
--                 hints = { "italic" },
--                 warnings = { "italic" },
--                 information = { "italic" },
--             },
--             underlines = {
--                 errors = { "underdotted" },
--                 warnings = { "underdotted" },
--             },
--         },
--     },
--     highlight_overrides = {
--         mocha = function(mocha)
--             return {
--             }
--         end,
--     },
-- })
