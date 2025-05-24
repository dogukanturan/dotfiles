UNAME := $(shell uname)

FISH_CONFIG_DIR := ~/.config/fish

all: sync

sync:
	mkdir -p ~/source/devops/{dev,ops}/
	mkdir -p ~/.config/ghostty

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || ln -snf $(PWD)/Brewfile ~/.Brewfile
endif
	ln -snf $(PWD)/fish/functions $(FISH_CONFIG_DIR)/functions
	ln -snf $(PWD)/fish/config.fish $(FISH_CONFIG_DIR)/config.fish
	ln -snf $(PWD)/fish/conf.d/abbr.fish $(FISH_CONFIG_DIR)/conf.d/abbr.fish
	ln -snf $(PWD)/fish/conf.d/env.fish $(FISH_CONFIG_DIR)/conf.d/env.fish
	ln -snf $(PWD)/fish/conf.d/alias.fish $(FISH_CONFIG_DIR)/conf.d/alias.fish
	ln -snf $(PWD)/kubectl_aliases.fish ~/.kubectl_aliases.fish

	ln -snf $(PWD)/nvim ~/.config/nvim
	ln -snf $(PWD)/gitconfig ~/.gitconfig
	ln -snf $(PWD)/gitignore_global ~/.gitignore_global

	mkdir -p ~/.config/tmux
	ln -snf $(PWD)/tmux.conf ~/.config/tmux/tmux.conf

	ln -snf $(PWD)/curl_format ~/.curl_format
	ln -snf $(PWD)/ghostty.config ~/.config/ghostty/config


clean:
	rm -rfv $(FISH_CONFIG_DIR)/config.fish
	rm -rfv $(FISH_CONFIG_DIR)/conf.d/abbr.fish
	rm -rfv $(FISH_CONFIG_DIR)/conf.d/env.fish
	rm -rfv $(FISH_CONFIG_DIR)/conf.d/alias.fish
	rm -rfv ~/.config/nvim
	rm -fv ~/.Brewfile
	rm -fv ~/.gitconfig
	rm -fv ~/.gitignore_global
	rm -fv ~/.kubectl_aliases.fish
	rm -fv ~/.tmux.conf
	rm -rfv ~/.tmux
	rm -fv ~/.curl_format
	rm -fv ~/.config/ghostty/config

.PHONY: all clean sync
