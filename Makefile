UNAME := $(shell uname)

FISH_CONFIG_DIR := ~/.config/fish

all: sync

sync:
	mkdir -p ~/source/devops/{dev,ops}/
	mkdir -p ~/.config/ghostty

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || ln -snf $(PWD)/Brewfile ~/.Brewfile
endif
	ln -snf $(PWD)/nvim ~/.config/nvim
	ln -snf $(PWD)/gitconfig ~/.gitconfig
	ln -snf $(PWD)/gitignore_global ~/.gitignore_global

	mkdir -p ~/.config/tmux
	ln -snf $(PWD)/tmux.conf ~/.config/tmux/tmux.conf

	ln -snf $(PWD)/curl_format ~/.curl_format
	ln -snf $(PWD)/ghostty.config ~/.config/ghostty/config


clean:
	rm -rfv ~/.config/nvim
	rm -fv ~/.Brewfile
	rm -fv ~/.gitconfig
	rm -fv ~/.gitignore_global
	rm -fv ~/.config/tmux/tmux.conf
	rm -fv ~/.curl_format
	rm -fv ~/.config/ghostty/config

.PHONY: all clean sync
