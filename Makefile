UNAME := $(shell uname)

all: sync

sync:
	mkdir -p ~/.tmux
	mkdir -p ~/source/devops/{dev,ops}/
	mkdir -p ~/source/devops/ops/kubernetes/k3d
	mkdir -p ~/.config/fish

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || ln -snf $(PWD)/Brewfile ~/.Brewfile
endif
	ln -snf $(PWD)/config.fish ~/.config/fish/config.fish
	[ -f ~/.config/fish/fish_aliases.fish ] || ln -snf $(PWD)/fish_aliases.fish ~/.config/fish/fish_aliases.fish
	[ -f ~/.config/fish/fish_profile ] || ln -snf $(PWD)/fish_profile ~/.config/fish/fish_profile

	[ -L ~/.config/nvim ] || ln -snf $(PWD)/nvim ~/.config/nvim
	[ -L ~/.config/kitty ] || ln -snf $(PWD)/kitty ~/.config/kitty

	[ -f ~/.gitconfig ] || ln -snf $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -snf $(PWD)/gitignore_global ~/.gitignore_global

	[ -f ~/.kubectl_aliases.fish ] || ln -snf $(PWD)/kubectl_aliases.fish ~/.kubectl_aliases.fish

	[ -f ~/.tmux.conf ] || ln -snf $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.curl_format ] || ln -snf $(PWD)/curl_format ~/.curl_format

	[ -f ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml ] || ln -snf $(PWD)/configs/k3d_config.yaml ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml

copy:
	mkdir -p ~/.tmux
	mkdir -p ~/source/devops/{dev,ops}/
	mkdir -p ~/source/devops/ops/kubernetes/k3d
	mkdir -p ~/.config/fish

ifeq ($(UNAME), Darwin)
	[ -f ~/.Brewfile ] || cp $(PWD)/Brewfile ~/.Brewfile
endif
	[ -f ~/.config/fish/functions ] || cp -R $(PWD)/functions ~/.config/fish/functions
	[ -f ~/.config/fish/config.fish ] || cp $(PWD)/config.fish ~/.config/fish/config.fish
	[ -f ~/.config/fish/fish_aliases.fish ] || cp $(PWD)/fish_aliases.fish ~/.config/fish/fish_aliases.fish
	[ -f ~/.config/fish/fish_profile ] || cp $(PWD)/fish_profile ~/.config/fish/fish_profile

	[ -f ~/.config/nvim ] || cp -R $(PWD)/nvim ~/.config/nvim
	[ -f ~/.config/kitty ] || cp -R $(PWD)/kitty ~/.config/kitty

	[ -f ~/.gitconfig ] || cp $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || cp $(PWD)/gitignore_global ~/.gitignore_global

	[ -f ~/.kubectl_aliases.fish ] || cp $(PWD)/kubectl_aliases.fish ~/.kubectl_aliases.fish

	[ -f ~/.tmux.conf ] || cp $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.curl_format ] || cp $(PWD)/curl_format ~/.curl_format

	[ -f ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml ] || cp $(PWD)/configs/k3d_config.yaml ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml

clean:
	rm -rfv ~/.config/fish/functions
	rm -fv ~/.config/fish/config.fish
	rm -fv ~/.config/fish/fish_aliases.fish
	rm -fv ~/.config/fish/fish_profile

	rm -rfv ~/.config/nvim
	rm -rfv ~/.config/kitty

	rm -fv ~/.Brewfile

	rm -fv ~/.gitconfig
	rm -fv ~/.gitignore_global

	rm -fv ~/.kubectl_aliases.fish

	rm -fv ~/.tmux.conf
	rm -rfv ~/.tmux

	rm -fv ~/.curl_format

	rm -fv ~/source/devops/ops/kubernetes/k3d/k3d_config.yaml

.PHONY: all clean sync copy
