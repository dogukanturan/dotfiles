fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.krew/bin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/go/bin

set -Ux GOPATH $HOME/.go
fish_add_path $GOPATH/bin
