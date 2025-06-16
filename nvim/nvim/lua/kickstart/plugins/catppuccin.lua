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
    textcolor = '#cdd6f4'
    require('catppuccin').setup {
      highlight_overrides = {
        all = function(colors)
          return {
            ['@parameter'] = { fg = textcolor },
            ['@text'] = { fg = textcolor },
            ['@field'] = { fg = textcolor },
            ['@property'] = { fg = textcolor },
            ['@module'] = { fg = textcolor },
            ['@variable.parameter'] = { fg = textcolor },
            ['@variable.member'] = { fg = textcolor },
            ['@variable'] = { fg = textcolor },
            ['@type'] = { fg = textcolor },
            ['@type.builtin'] = { fg = textcolor },
            ['@keyword.function'] = { fg = textcolor },
            ['@keyword.conditional'] = { fg = '#cba6f7' },
            ['@keyword.repeat'] = { fg = '#cba6f7' },
            ['@keyword.return'] = { fg = '#c2eebd' },
            ['@function.call'] = { fg = textcolor },
            ['@function.builtin'] = { fg = textcolor },
            ['@boolean'] = { fg = textcolor },
            ['@number'] = { fg = '#fbc19d' },
            ['@constant.builtin'] = { fg = textcolor },
            ['@comment'] = { fg = '#bcc5fe' },
            ['@spell'] = { fg = '#ebbaef' },
            ['@string'] = { fg = '#ebbaef' },
            Function = { fg = textcolor },
            Keyword = { fg = textcolor },
            Character = { fg = textcolor },
            Constant = { fg = textcolor },
            Special = { fg = textcolor },
            Operator = { fg = textcolor },
            Identifier = { fg = textcolor },
            Type = { fg = textcolor },
            Structure = { fg = textcolor },
            Label = { fg = textcolor },
            Exception = { fg = textcolor },
            PreProc = { fg = textcolor },
            Include = { fg = textcolor },
            Macro = { fg = textcolor },
            StorageClass = { fg = textcolor },
            Boolean = { fg = '#fcceb2' },
            Number = { fg = '#fcceb2' },
            String = { fg = '#ebbaef' },
            Comment = { fg = '#b4befe' },
            Conditional = { fg = '#bac2de' },
            Repeat = { fg = '#bac2de' },
          }
        end,
      },
    }
    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
