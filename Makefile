UNAME := $(shell uname)

all: sync

sync:
	mkdir -p ~/source/devops/{dev,ops}/
	mkdir -p ~/.config/ghostty
	mkdir -p ~/.config/tmux

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || ln -snf $(PWD)/Brewfile ~/.Brewfile
endif
	ln -snf $(PWD)/nvim ~/.config/nvim
	ln -snf $(PWD)/gitconfig ~/.gitconfig
	ln -snf $(PWD)/gitignore_global ~/.gitignore_global

	ln -snf $(PWD)/zsh/zshrc ~/.zshrc
	ln -snf $(PWD)/zsh/zprofile ~/.zprofile
	ln -snf $(PWD)/zsh/zsh_aliases ~/.zsh_aliases

	ln -snf $(PWD)/fish ~/.config/fish
	ln -snf $(PWD)/kubectl_aliases.fish ~/.kubectl_aliases.fish

	ln -snf $(PWD)/tmux.conf ~/.config/tmux/tmux.conf
	ln -snf $(PWD)/tmux.conf ~/.tmux.conf

	ln -snf $(PWD)/curl_format ~/.curl_format
	ln -snf $(PWD)/ghostty.config ~/.config/ghostty/config

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
