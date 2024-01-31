#theme_gruvbox dark hard
set fish_greeting ""
set -gx fish_user_paths $fish_user_paths  $HOME/.nimble/bin
set -gx fish_user_paths $fish_user_paths $HOME/.cargo/bin
set -gx fish_user_paths $fish_user_paths $HOME/go/bin
set -gx fish_user_paths $fish_user_paths $HOME/.dbox/bin
set -Ux EDITOR hx
set -Ux PIPENV_VENV_IN_PROJECT 1
alias vim=hx
alias v=hx
alias g=lazygit
alias c=hx
alias ze="zellij edit"
alias zef="zellij edit -f -c"
alias zr="zellij run"
alias zrf="zellij run -f -c"

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

function ztp 
    zellij action new-tab --name $argv[1] --layout two-panes
end

function git-branch-name 
    git rev-parse --abbrev-ref HEAD
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

if test -d $HOME/.asdf
  source $HOME/.asdf/asdf.fish
  source $HOME/.asdf/completions/asdf.fish
end
