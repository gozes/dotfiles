# Nushell Config File
# Translated from fish shell configuration

# Remove greeting message
$env.config = ($env.config | upsert show_banner false)

# Set environment variables
$env.PATH = ($env.PATH | prepend [
  $"($env.HOME)/.nimble/bin"
  $"($env.HOME)/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"
  $"($env.HOME)/.cargo/bin"
  $"($env.HOME)/go/bin"
  $"($env.HOME)/.dbox/bin"
  $"($env.HOME)/.local/gozes/bin"
  $"($env.HOME)/swift/usr/bin"
])

$env.EDITOR = "nvim"
$env.GTK_THEME = "Adwaita:dark"
$env.ZK_NOTEBOOK_DIR = $"($env.HOME)/notes"

# Aliases
alias vim = nvim
alias v = nvim
alias g = lazygit
alias c = nvim
alias ze = "zellij edit"
alias zef = "zellij edit -f -c"
alias zr = "zellij run"
alias zrf = "zellij run -f -c"
alias ztn = "zellij action go-to-next-tab"
alias ztp = "zellij action go-to-previous-tab"

# Git aliases
alias gls = "git log --stat"
alias glsp = "git log --stat -p"
alias glo = "git log --oneline --decorate"
alias glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glod = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glog = "git log --oneline --decorate --graph"
alias gp = "git push"
alias gf = "git fetch"
alias gpd = "git push --dry-run"
alias gpf = "git push --force-with-lease"
alias gpf! = "git push --force"
alias grba = "git rebase --abort"
alias grbc = "git rebase --continue"
alias grbi = "git rebase -i"
alias grbim = "git rebase -i main"
alias grbis = "git rebase -i --autosquash"
alias gsh = "git show"
alias gss = "git status -s"
alias gc = "git commit"
alias gca = "git commit --amend"
alias gcane = "git commit --amend --no-edit"
alias gcmsg = "git commit -m"
alias gap = "git add -p"
alias gwc = "git clone --bare"
alias gwar = "git worktree add review main"
alias gwab = "git worktree add -b"
alias gwd = "git worktree remove"
alias gco = "git checkout"
alias gcb = "git checkout -b"
alias gd = "git diff"
alias gdc = "git diff --cached"
alias gdcw = "git diff --cached --word-diff"
alias gdw = "git diff --word-diff"

# Custom functions

def glogdig [branch: string] {
  ^git log --merges --ancestry-path --oneline $branch..origin | tail
}

def gpickaxeall [text: string] {
  ^git log -S $text -p
}

def gpickaxefile [text: string, file: string] {
  ^git log -S $text -p $file
}

def gpickaxefirstadded [text: string] {
  ^git log -S $text -p --reverse
}

def gshb [file: string, line: string] {
  let hash = (^git blame $file -L $line | awk '{print $1}')
  ^git show $hash
}

def gcmsgf [...msg: string] {
  ^git commit -m $"fixup! ($msg | str join ' ')"
}

def ggt [pattern: string, dir: string] {
  ^gotests -w -template testify -only $pattern $dir
}

def znt [name: string] {
  ^zellij action new-tab --name $name --layout two-panes
}

def zss [name: string] {
  ^zellij action new-tab --name $name --layout small-screen
}

def git-branch-name [] {
  ^git rev-parse --abbrev-ref HEAD
}

def git-repo-name [] {
  ^basename (^git rev-parse --show-toplevel)
}

def gh-workflow-name [] {
  ^gh run list --limit 1 --json workflowName --jq '.[].workflowName'
}

def gh-workflow-id [] {
  let branch = (git-branch-name)
  ^gh run list --limit 1 --json databaseId --jq '.[].databaseId' -b $branch
}

def gh-status [] {
  let id = (gh-workflow-id)
  ^gh run view $id
}

def gh-info-json [] {
  let id = (gh-workflow-id)
  ^gh run view $id --json jobs --jq '[.jobs[] | {name,conclusion,databaseId,url}]'
}

def gh-watch [] {
  let id = (gh-workflow-id)
  ^gh run watch $id -i1
}

def gh-rerun [] {
  let id = (gh-workflow-id)
  ^gh run rerun $id --failed
}

def gh-make-pr [title: string] {
  ^gh pr create --title $title
}

def gh-failed-step-id [] {
  (gh-info-json | ^jq '.[] | select(.conclusion="failure") | .databaseId')
}

def gh-view-failed-job [] {
  let wid = (gh-workflow-id)
  let jid = (gh-failed-step-id)
  ^gh run view $wid -j $jid
}

def gh-view-failed-job-web [] {
  let wid = (gh-workflow-id)
  let jid = (gh-failed-step-id)
  ^gh run view $wid -j $jid -w
}

def gh-pr-number [] {
  ^gh pr list -A "@me" --json number --jq '.[].number'
}

def gh-opscha [] {
  let id = (gh-pr-number)
  ^gh pr comment $id -b "@services OPSCHA"
}

def gh-failed-logs [] {
  let id = (gh-workflow-id)
  ^gh run view $id --log-failed
}

def gh-download [] {
  let id = (gh-workflow-id)
  ^gh run download $id
}

def gh-cancel [] {
  let id = (gh-workflow-id)
  ^gh run cancel $id
}

def kitty-reload-config [] {
  ^kill -SIGUSR1 (^pgrep kitty)
}

def install-rpm-fusion [] {
  ^bash -c "sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm ; sudo dnf config-manager --enable fedora-cisco-openh264"
}

def install-brew [] {
  ^bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

def install-cil-tools-from-brew [] {
  ^brew install neovim go fzf eza zoxide bat git-delta zellij viu catimg jj just zk
}

def install-cil-tools-from-fedora [] {
  ^sudo dnf install ImageMagick ImageMagick-devel
}

def install-posting-cil [] {
  ^uv tool install --python 3.12 posting
}

def httpw [] {
  ^posting --collection $"($env.HOME)/Code/Work/posting"
}

# Check for existence of commands and set up tools accordingly

# Setup Homebrew if available
let homebrew_path = if ($nu.os-info.name == "linux") {
  "/home/linuxbrew/.linuxbrew"
} else if ($nu.os-info.name == "macos") {
  "/opt/homebrew"
} else {
  ""
}

if ($homebrew_path != "" and ($homebrew_path | path exists)) {
  $env.HOMEBREW_PREFIX = $homebrew_path
  $env.HOMEBREW_CELLAR = $"($env.HOMEBREW_PREFIX)/Cellar"
  $env.HOMEBREW_REPOSITORY = if ($nu.os-info.name == "linux") {
    $"($env.HOMEBREW_PREFIX)/Homebrew"
  } else {
    $"($env.HOMEBREW_PREFIX)/homebrew"
  }
  
  $env.PATH = ($env.PATH | prepend [$"($env.HOMEBREW_PREFIX)/bin", $"($env.HOMEBREW_PREFIX)/sbin"])
  $env.MANPATH = (if ($env | get -i MANPATH | is-empty) { [] } else { $env.MANPATH }) | prepend $"($env.HOMEBREW_PREFIX)/share/man"
  $env.INFOPATH = (if ($env | get -i INFOPATH | is-empty) { [] } else { $env.INFOPATH }) | prepend $"($env.HOMEBREW_PREFIX)/share/info"
}

# Setup eza if installed
if not (which eza | is-empty) {
  alias ll = "eza --icons -a -T --level=1 --group-directories-first --no-permissions --no-user --no-time --no-filesize"
}

# Setup zoxide if installed
if not (which zoxide | is-empty) {
  zoxide init nushell | save -f ~/.zoxide.nu
  source ~/.zoxide.nu
}

# Setup FZF if installed
if not (which fzf | is-empty) {
  $env.FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git"
  $env.FZF_CTRL_T_COMMAND = $env.FZF_DEFAULT_COMMAND
  $env.FZF_ALT_C_COMMAND = "fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  $env.FZF_DEFAULT_OPTS = "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 --color=selected-bg:#45475a --multi"
}

# Setup uv if installed
if not (which uv | is-empty) {
  $env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/share/../bin")
}

# Setup bat if installed
if not (which bat | is-empty) {
  $env.BAT_THEME = "Catppuccin Mocha"
  $env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"
}

# Source work.fish if it exists
let work_config = $"($env.HOME)/Code/Work/work.fish"
if ($work_config | path exists) {
  # Note: You may need to convert your work.fish to Nushell format separately
  # and source that file instead
}

# Setup zellij if installed
if not (which zellij | is-empty) {
  $env.ZELLIJ_AUTO_ATTACH = "true"
  
  # Note: Nushell doesn't have a direct equivalent for zellij's setup for Fish.
  # You may need to adapt this to your workflow or look for Nushell-specific zellij integrations.
  
  # A simple alternative for auto-starting zellij:
  if (not ($env | get -i ZELLIJ_SESSION_NAME | is-empty)) and (not (pgrep zellij | is-empty)) {
    zellij
  }
}
