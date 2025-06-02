return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
      local hub = require('mcphub').get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ''
    end,
    custom_tools = function()
      return {
        require('mcphub.extensions.avante').mcp_tool(),
      }
    end,
    disabled_tools = {
      'list_files', -- Built-in file operations
      'search_files',
      'read_file',
      'create_file',
      'rename_file',
      'delete_file',
      'create_dir',
      'rename_dir',
      'delete_dir',
      'bash', -- Built-in terminal access
    },
    mappings = {
      ask = '<M-a>a', -- ask
      edit = '<M-a>e', -- edit
      refresh = '<M-a>r', -- refresh
      focus = '<M-a>f',
      files = {
        add_current = '<M-a>c', -- Add current buffer to selected files
        toggle = {
          default = '<M-a>t',
          debug = '<M-a>d',
          hint = '<M-a>h',
          suggestion = '<M-a>s',
          repomap = '<M-a>R',
        },
      },
    },
    provider = 'copilot',
    copilot = {
      model = 'gpt-4.5-preview',
    },
    behaviour = {
      enable_token_counting = false,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    'ravitemer/mcphub.nvim',
  },
  cond = function()
    vim.fn.system 'which gh'
    if vim.v.shell_error ~= 0 then
      return false
    end
    return true
  end,
}
