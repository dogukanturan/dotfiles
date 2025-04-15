UNAME := $(shell uname)

FISH_CONFIG_DIR := ~/.config/fish

all: sync

sync:
	mkdir -p ~/source/devops/{dev,ops}/

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || ln -snf $(PWD)/Brewfile ~/.Brewfile
endif
	ln -snf $(PWD)/config.fish $(FISH_CONFIG_DIR)/config.fish
	ln -snf $(PWD)/abbr.fish $(FISH_CONFIG_DIR)/conf.d/abbr.fish
	ln -snf $(PWD)/env.fish $(FISH_CONFIG_DIR)/conf.d/env.fish
	ln -snf $(PWD)/nvim ~/.config/nvim
	ln -snf $(PWD)/gitconfig ~/.gitconfig
	ln -snf $(PWD)/gitignore_global ~/.gitignore_global
	ln -snf $(PWD)/kubectl_aliases.fish ~/.kubectl_aliases.fish

	mkdir -p ~/.config/tmux
	ln -snf $(PWD)/tmux.conf ~/.config/tmux/tmux.conf

	ln -snf $(PWD)/curl_format ~/.curl_format

	ln -snf $(PWD)/functions $(FISH_CONFIG_DIR)/functions

clean:
	# Temizleme işlemleri
	rm -rfv $(FISH_CONFIG_DIR)/functions
	rm -rfv $(FISH_CONFIG_DIR)/config.fish
	rm -rfv $(FISH_CONFIG_DIR)/conf.d/abbr.fish
	rm -rfv $(FISH_CONFIG_DIR)/conf.d/env.fish
	rm -rfv ~/.config/nvim
	rm -fv ~/.Brewfile
	rm -fv ~/.gitconfig
	rm -fv ~/.gitignore_global
	rm -fv ~/.kubectl_aliases.fish
	rm -fv ~/.tmux.conf
	rm -rfv ~/.tmux
	rm -fv ~/.curl_format

.PHONY: all clean sync
