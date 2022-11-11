OS  = $(shell uname)

all: tmux zsh vim

tmux:
	@echo "====================="
	@echo "= Linking tmux files:"	
	mkdir -p ./backups
	scripts/link .tmux.conf
	scripts/link .tmux.conf.local
	scripts/link .tmux
	@echo "====================="
	
zsh:
	@echo "====================="
	@echo "= Linking zsh files:"	
	git clone --recurse-submodules https://github.com/everestmz/zprezto.git ./.zprezto
	mkdir -p ./backups
	scripts/link .zshrc
	scripts/link .zprezto
	scripts/link .zpreztorc
	@echo "====================="

vim:
	@echo "====================="
	@echo "= Linking vim files:"	
	mkdir -p ./backups
	scripts/link .vimrc
	mkdir -p $HOME/.vim/swapfiles
	mkdir -p $HOME/.vim/backups
	@echo "====================="

debian:
ifeq ($(OS), Linux)
	@echo "====================="
	@echo "= We're on Linux - linking os-specific files"
	@echo "= Linking .Xresources"
	scripts/link .Xresources
	@echo "= Linking i3 configs"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/i3status
	scripts/link .config/i3/config
	scripts/link .config/i3status/config
	@echo "====================="
endif
