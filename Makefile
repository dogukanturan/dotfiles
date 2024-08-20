UNAME := $(shell uname)

all: sync

sync:
	mkdir -p ~/.tmux
	mkdir -p ~/source/devops/{dev,ops}/
	mkdir -p ~/source/devops/ops/kubernetes/k3d

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || ln -snf $(PWD)/Brewfile ~/.Brewfile
endif
	[ -L ~/.functions ] || ln -snf $(PWD)/zsh/functions ~/.functions
	[ -L ~/.config/nvim ] || ln -snf $(PWD)/nvim ~/.config/nvim
	[ -L ~/.config/kitty ] || ln -snf $(PWD)/kitty ~/.config/kitty

	[ -f ~/.zshrc ] || ln -snf $(PWD)/zsh/zshrc ~/.zshrc
	[ -f ~/.zsh_aliases ] || ln -snf $(PWD)/zsh/zsh_aliases ~/.zsh_aliases
	[ -f ~/.zprofile ] || ln -snf $(PWD)/zsh/zprofile ~/.zprofile
	[ -f ~/.p10k.zsh ] || ln -snf $(PWD)/zsh/p10k.zsh ~/.p10k.zsh

	[ -f ~/.gitconfig ] || ln -snf $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -snf $(PWD)/gitignore_global ~/.gitignore_global

	[ -f ~/.kubectl_aliases ] || ln -snf $(PWD)/kubectl_aliases ~/.kubectl_aliases

	[ -f ~/.tmux.conf ] || ln -snf $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.curl_format ] || ln -snf $(PWD)/curl_format ~/.curl_format

	[ -f ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml ] || ln -snf $(PWD)/configs/k3d_config.yaml ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml


clean:
	rm -rfv ~/.functions
	rm -rfv ~/.config/nvim
	rm -rfv ~/.config/kitty

	rm -fv ~/.Brewfile

	rm -fv ~/.zshrc
	rm -fv ~/.zsh_aliases
	rm -fv ~/.zprofile
	rm -fv ~/.p10k.zsh

	rm -fv ~/.gitconfig
	rm -fv ~/.gitignore_global

	rm -fv ~/.kubectl_aliases

	rm -fv ~/.tmux.conf
	rm -rfv ~/.tmux

	rm -fv ~/.curl_format

	rm -fv ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml

.PHONY: all clean sync
