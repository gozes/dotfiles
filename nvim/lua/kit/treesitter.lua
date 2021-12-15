local parsers = require("nvim-treesitter.parsers")

local enabled_list = {"clojure", "fennel","racket"}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
  enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
      enable = true,
      colors = {
          "#E06C75",
          "#E5C07B",
          "#98C379",
          "#56B6C2",
          "#61AFEF",
          "#C678DD",
          "#E06C75"
        },
      extended_mode = true,
      max_file_lines = nil,
      disable = vim.tbl_filter(
      function(p) 
           local disable = true
           for _, lang in pairs(enabled_list) do
               if p==lang then disable = false end
            end
            return disable
      end, parsers.available_parsers()
      )
  }
}
