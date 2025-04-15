set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH /opt/homebrew/bin

# Golang
set -gx GOPATH $HOME/source/devops/dev/go
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH /usr/local/go/bin
