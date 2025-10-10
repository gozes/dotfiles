#!/usr/bin/env fish
# Load your fish config so all env vars and mise PATH are applied
if test -f ~/dotfiles/fish/fish/config.fish
    source ~/dotfiles/fish/fish/config.fish
end

# If you also use conf.d snippets, they’re sourced by fish automatically.
# If you rely on per-project activation, you can optionally:
# eval (mise env fish) 2>/dev/null

# Exec the mise-managed opencode
exec opencode serve --port 6660
