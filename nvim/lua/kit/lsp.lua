require'lspconfig'.pyright.setup{}

require'lspconfig'.gopls.setup{}

require'lspconfig'.clojure_lsp.setup{}

require('lspconfig').yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "/cloudformation/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml"
            },
            format = {enabled = false},
            customTags = { 
                    "!And scalar",
                    "!And mapping",
                    "!And sequence",                
                    "!If scalar",
                    "!If mapping",
                    "!If sequence",                
                    "!Not scalar",
                    "!Not mapping",
                    "!Not sequence",                
                    "!Equals scalar",
                    "!Equals mapping",
                    "!Equals sequence",                
                    "!Or scalar",
                    "!Or mapping",
                    "!Or sequence",                
                    "!FindInMap scalar",
                    "!FindInMap mappping",        
                    "!FindInMap sequence",
                    "!Base64 scalar",
                    "!Base64 mapping",
                    "!Base64 sequence",                
                    "!Cidr scalar",
                    "!Cidr mapping",
                    "!Cidr sequence",                
                    "!Ref scalar",
                    "!Ref mapping",
                    "!Ref sequence",                
                    "!Sub scalar",
                    "!Sub mapping",
                    "!Sub sequence",                
                    "!GetAtt scalar",
                    "!GetAtt mapping",
                    "!GetAtt sequence",                
                    "!GetAZs scalar",
                    "!GetAZs mapping",
                    "!GetAZs sequence",                
                    "!ImportValue scalar",
                    "!ImportValue mapping",
                    "!ImportValue sequence",                
                    "!Select scalar",
                    "!Select mapping",
                    "!Select sequence",
                    "!Split scalar",
                    "!Split mapping",
                    "!Split sequence",                
                    "!Join scalar",
                    "!Join mapping",
                    "!Join sequence"
            },
        },
    },
}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- null-ls setup example
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/null-ls.lua

null_ls.setup {
  debug = false,
  sources = {
    formatting.black,
    formatting.cljstyle,
    diagnostics.pylint.with({method = null_ls.methods.DIAGNOSTICS_ON_SAVE,})
  },
}
