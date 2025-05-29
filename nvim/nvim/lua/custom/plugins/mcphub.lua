return {
  'ravitemer/mcphub.nvim',
  opts = {
    use_bundled_binary = true,
    extensions = {
      avante = {
        make_slash_commands = true, -- make /slash commands from MCP server prompts
      },
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
    'nvim-lua/plenary.nvim', -- Required for Job and HTTP requests
  },
  -- uncomment the following line to load hub lazily
  --cmd = "MCPHub",  -- lazy load
  --build = 'npm install -g mcp-hub@latest', -- Installs required mcp-hub npm module
  -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  build = 'bundled_build.lua', -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
}
