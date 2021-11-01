require'lspconfig'.pyright.setup{}

require'lspconfig'.gopls.setup{}

require'lspconfig'.yamlls.setup(
  
    cmd = { "yaml-language-server", "--stdio" }
    filetypes = { "yaml" }
    root_dir = root_pattern(".git") or dirname
    settings = {
        yaml = {
            format = {
                enable = false
            }
        }
      redhat = {
        telemetry = {
          enabled = false
        }
      }
    }
)

require'lspconfig'.clojure_lsp.setup{}

