# dotfiles

Personal development environment configuration for macOS / Linux.

## What's included

| Tool       | Config                          |
|------------|---------------------------------|
| Fish       | `fish/`                         |
| Zsh        | `zsh/`                          |
| Neovim     | `nvim/`                         |
| tmux       | `tmux.conf`                     |
| Git        | `gitconfig`, `gitignore_global` |
| Ghostty    | `ghostty.config`                |
| Homebrew   | `Brewfile`                      |

## Setup

```bash
git clone git@github.com:dogukanturan/dotfiles.git ~/dotfiles
cd ~/dotfiles

make all

brew bundle --global

fisher update

./scripts/install_zsh_plugins.sh
```

## Clean up

```bash
make clean
```

## License

Apache License 2.0
