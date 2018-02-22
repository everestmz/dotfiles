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
	git clone --recurse-submodules https://github.com/everestmz/zprezto.git ./.zprezto
	mkdir -p ./backups
	scripts/link ~/.zshrc
	scripts/link ~/.zprezto
	scripts/link ~/.zpreztorc
	@echo "====================="

vim:
	@echo "====================="
	@echo "= Linking vim files:"	
	git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
	#igit clone  .vim/bundle/vundle
	mkdir -p ./backups
	scripts/link ~/.vim
	scripts/link ~/.vimrc
	@echo "====================="

