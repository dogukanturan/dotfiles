if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
end

set -gx EDITOR nvim
set -gx KUBE_EDITOR nvim
set -gx GPG_TTY (tty)
set -gx GO111MODULE auto

if test -d $HOME/source/devops/dev/go
    set -gx GOPATH $HOME/source/devops/dev/go
    fish_add_path -a $GOPATH/bin
end

if test -d (set -q KREW_ROOT; and echo $KREW_ROOT; or echo $HOME/.krew)/bin
    fish_add_path -m (set -q KREW_ROOT; and echo $KREW_ROOT; or echo $HOME/.krew)/bin
end

if status is-interactive
    test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
end
