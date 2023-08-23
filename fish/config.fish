#theme_gruvbox dark hard
set fish_greeting ""
set -gx fish_user_paths $fish_user_paths  $HOME/.nimble/bin
set -gx fish_user_paths $fish_user_paths $HOME/.cargo/bin
set -gx fish_user_paths $fish_user_paths $HOME/go/bin
set -Ux EDITOR hx
set -Ux PIPENV_VENV_IN_PROJECT 1
alias vim=hx
alias v=hx
alias g=lazygit
alias c=hx
alias ze=zellij edit -f
alias zep=zellij edit
alias zr=zellij run -f
alias zrp=zellij run

if test (uname) = "Darwin"
    set -Ux JAVA_8_HOME (/usr/libexec/java_home -v 1.8)
    set -Ux JAVA_11_HOME (/usr/libexec/java_home -v 11)
    set -Ux JAVA_14_HOME (/usr/libexec/java_home -v 14)
    alias java8="set -x JAVA_HOME (echo $JAVA_8_HOME )"
    alias java11="set -x JAVA_HOME (echo $JAVA_11_HOME )"
    alias java14="set -x JAVA_HOME (echo $JAVA_14_HOME )"
   # set -Ux JAVA_HOME $JAVA_8_HOME
end

function ggt
    gotests -w -template testify -only $argv[1] $argv[2]
end
