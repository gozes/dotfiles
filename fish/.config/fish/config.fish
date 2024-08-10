#theme_gruvbox dark hard
set fish_greeting ""
set -gx fish_user_paths $fish_user_paths  $HOME/.nimble/bin
set -gx fish_user_paths $fish_user_paths $HOME/.cargo/bin
set -gx fish_user_paths $fish_user_paths $HOME/go/bin
set -gx fish_user_paths $fish_user_paths $HOME/.dbox/bin
set -gx fish_user_paths $fish_user_paths $HOME/.local/gozes/bin
set -Ux EDITOR nvim
set -Ux GTK_THEME Adwaita:dark
alias vim=nvim
alias v=nvim
alias g=lazygit
alias c=nvim
alias ze="zellij edit"
alias zef="zellij edit -f -c"
alias zr="zellij run"
alias zrf="zellij run -f -c"
alias ztn="zellij action go-to-next-tab"
alias ztp="zellij action go-to-previous-tab"
alias gls="git log --stat"
alias glsp="git log --stat -p"
alias glo="git log --oneline --decorate"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glog="git log --oneline --decorate --graph"
alias gp="git push"
alias gpd="git push --dry-run"
alias gpf="git push --force-with-lease"
alias gpf!="git push --force"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grbin="git rebase -i HEAD~"
alias grbim="git rebase -i main"
alias grbims="git rebase -i --autosquash main"
alias gsh="git show"
alias gss="git status -s"
alias gco="git commit"
alias gcoa="git commit --amend"
alias gcoane="git commit --amend --no-edit"
alias gcmsg="git commit -m"
alias gap="git add -p"
function gcmsgf
    git commit -m (string join '' "fixup! " $argv)
end
alias gcb="git checkout -b"
alias gd="git diff"
alias gdca="git diff --cached"
alias gdcw="git diff --cached --word-diff"
alias gdw="git diff --word-diff"
if command -q eza
    alias ll="eza --icons -a -T  --level=1 --group-directories-first --no-permissions --no-user --no-time --no-filesize"
end

function ggt
    gotests -w -template testify -only $argv[1] $argv[2]
end

function znt 
    zellij action new-tab --name $argv[1] --layout two-panes
end

function zss
    zellij action new-tab --name $argv[1] --layout small-screen
end

function git-branch-name 
    git rev-parse --abbrev-ref HEAD
end

function git-repo-name
    basename (git rev-parse --show-toplevel)
end

function gh-workflow-name
    gh run list --limit 1 --json workflowName --jq '.[].workflowName'
end

function gh-workflow-id
    set -l branch (git-branch-name)
    gh run list --limit 1 --json databaseId --jq '.[].databaseId' -b $branch
end

function gh-status
    set -l id (gh-workflow-id)
    gh run view $id
end

function gh-info-json
    set -l id (gh-workflow-id) --json jobs --jq '[.jobs[] | {name,conclusion,databaseId,url}]'
    gh run view $id
end

function gh-watch
    set -l id (gh-workflow-id) 
    gh run watch $id -i1
end

function gh-rerun
    set -l id (gh-workflow-id)
    gh run rerun $id --failed
end

function gh-make-pr 
    gh pr create --title $argv[1]
end


function gh-failed-step-id
    echo (gh-info-json) | jq '.[] | select(.conclusion="failure") | .databaseId'
end

function gh-view-failed-job
    set -l wid (gh-workflow-id)
    set -l jid (gh-failed-step-id)
    gh run view $wid -j $jid
end 
function gh-view-failed-job-web
    set -l wid (gh-workflow-id)
    set -l jid (gh-failed-step-id)
    gh run view $wid -j $jid -w
end 

function gh-pr-number
    gh pr list  -A "@me" --json number --jq '.[].number'
end
function gh-opscha
    set -l id (gh-pr-number)
    gh pr comment $id -b "@services OPSCHA"
end 

function gh-failed-logs
    set -l id (gh-workflow-id)
    gh run view $id --log-failed
end

function gh-download
    set -l id (gh-workflow-id)
    gh run download $id
end

function gh-cancel
    set -l id (gh-workflow-id)
    gh run cancel $id
end

function kitty-reload-config
    kill -SIGUSR1 (pgrep kitty)
end

if test -d $HOME/.asdf
  source $HOME/.asdf/asdf.fish
  source $HOME/.asdf/completions/asdf.fish
end
# https://fishshell.com/docs/current/cmds/status.html
# https://github.com/orgs/Homebrew/discussions/4412#discussioncomment-8651316
# https://github.com/ublue-os/bluefin/issues/687#issuecomment-1913341899
if status is-interactive
    if test -d /home/linuxbrew/.linuxbrew # Linux
	set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
	set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
	set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew"
    else if test -d /opt/homebrew # MacOS
	set -gx HOMEBREW_PREFIX "/opt/homebrew"
	set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
	set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/homebrew"
    end
    if test -n "$HOMEBREW_PREFIX"
        fish_add_path -gP "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin";
        ! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH;
        ! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH;
    end
end

if command -q zoxide
    zoxide init fish | source
end
