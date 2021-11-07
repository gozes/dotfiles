require'lspconfig'.pyright.setup{}

require'lspconfig'.gopls.setup{}

require'lspconfig'.clojure_lsp.setup{}

require('lspconfig').yamlls.setup {
    settings = {
        format = {
            enabled = false
        },
    },
}
vim.cmd [[ runtime plugin/astronauta.vim ]]
vim.lsp.handlers["textDocument/codeAction"] = require'lspactions'.codeaction
