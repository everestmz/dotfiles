all: tmux zsh vim

tmux:
	@echo "====================="
	@echo "= Linking tmux files:"	
	mkdir -p ./backups
	scripts/link ~/.tmux.conf
	scripts/link ~/.tmux.conf.local
	scripts/link ~/.tmux
	@echo "====================="
	
zsh:
	@echo "====================="
	@echo "= Linking zsh files:"	
	mkdir -p ./backups
	scripts/link ~/.zshrc
	scripts/link ~/.zprezto
	scripts/link ~/.zpreztorc
	@echo "====================="

vim:
	@echo "====================="
	@echo "= Linking vim files:"	
	mkdir -p ./backups
	scripts/link ~/.vim
	scripts/link ~/.vimrc
	@echo "====================="

