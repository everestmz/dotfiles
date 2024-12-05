OS  = $(shell uname)

all: tmux zsh vim debian hx starship

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
	mkdir -p ./backups
	scripts/link .zshrc
	@echo "====================="

hx:
	@echo "====================="
	@echo "= Linking helix files:"	
	mkdir -p ~/.config/helix
	scripts/link .config/helix/config.toml
	@echo "====================="

vim:
	@echo "====================="
	@echo "= Linking vim files:"	
	mkdir -p ./backups
	scripts/link .vimrc
	mkdir -p $HOME/.vim/swapfiles
	mkdir -p $HOME/.vim/backups
	@echo "====================="

starship:
	@echo "====================="
	@echo "= Linking starship files:"
	mkdir -p ./backups
	scripts/link .config/starship.toml
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
