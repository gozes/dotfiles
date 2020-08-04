#theme_gruvbox dark hard
set fish_greeting ""
set -gx fish_user_paths $fish_user_paths  $HOME/.nimble/bin
set -gx fish_user_paths $fish_user_paths $HOME/.cargo/bin
set -gx fish_user_paths $fish_user_paths $HOME/go/bin
set -gx fish_user_paths $fish_user_paths $HOME/.vim/plugged/vim-iced/bin
set -gx fish_user_paths $fish_user_paths $HOME/.emacs.d/bin
set -Ux EDITOR nvim
alias vim=nvim
