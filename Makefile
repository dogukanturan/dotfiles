UNAME := $(shell uname)
PWD := $(shell pwd)
HOME_DIR := $(HOME)

all: sync

	mkdir -p $(HOME_DIR)/.config/ghostty
	mkdir -p $(HOME_DIR)/.config/tmux
	mkdir -p $(HOME_DIR)/.config

ifeq ($(UNAME), Darwin)
	[ -f $(HOME_DIR)/.Brewfile ] || ln -snf $(PWD)/Brewfile $(HOME_DIR)/.Brewfile
endif
	rm -rf $(HOME_DIR)/.config/fish
	ln -snf $(PWD)/fish $(HOME_DIR)/.config/fish
	
	rm -rf $(HOME_DIR)/.config/nvim
	ln -snf $(PWD)/nvim $(HOME_DIR)/.config/nvim

	ln -snf $(PWD)/gitconfig $(HOME_DIR)/.gitconfig
	ln -snf $(PWD)/gitignore_global $(HOME_DIR)/.gitignore_global
	ln -snf $(PWD)/zsh/zshrc $(HOME_DIR)/.zshrc
	ln -snf $(PWD)/zsh/zprofile $(HOME_DIR)/.zprofile
	ln -snf $(PWD)/zsh/zsh_aliases $(HOME_DIR)/.zsh_aliases
	ln -snf $(PWD)/kubectl_aliases.fish $(HOME_DIR)/.kubectl_aliases.fish
	ln -snf $(PWD)/tmux.conf $(HOME_DIR)/.config/tmux/tmux.conf
	ln -snf $(PWD)/tmux.conf $(HOME_DIR)/.tmux.conf
	ln -snf $(PWD)/curl_format $(HOME_DIR)/.curl_format
	ln -snf $(PWD)/ghostty.config $(HOME_DIR)/.config/ghostty/config

clean:
	rm -rfv ~/.config/nvim
	rm -fv ~/.Brewfile
	rm -fv ~/.gitconfig
	rm -fv ~/.gitignore_global
	rm -fv ~/.zshrc ~/.zprofile ~/.zsh_aliases
	rm -rfv ~/.config/fish
	rm -fv ~/.kubectl_aliases.fish
	rm -fv ~/.config/tmux/tmux.conf ~/.tmux.conf
	rm -fv ~/.curl_format
	rm -fv ~/.config/ghostty/config

.PHONY: all clean sync
