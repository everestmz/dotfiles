# Everest Munro-Zeisberger zshrc
# Source Prezto.

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

###########
# HISTORY #
###########

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

########
# PATH #
########

# Python
export PATH=$PATH:/Users/everest/anaconda2/bin
export PATH="/usr/local/Cellar/python/2.7.11/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Languages
export PATH=$PATH:/Applications/Racket\ v6.9/bin
export PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin/pdflatex
export PATH=$PATH:/Users/everest/Library/Android/sdk/platform-tools

# CS 350
export PATH=$SYS161/bin:$PATH
export PATH=$SYS161/tools/bin:$PATH
export SYS161=$HOME/sys161

# AFL
export PATH=$PATH:$HOME/src/afl-2.52b

##########
# GCLOUD #
##########

###########
# Aliases #
###########

# Git
alias gd="git diff"
alias gr="git rebase"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias gco="git checkout"
alias gfo='git fetch --prune origin'
alias gfop='gfo && git pull'

# Zshrc
alias zshrc="vim ~/.zshrc"
alias zshreload=". ~/.zshrc"
alias R=". ~/.zshrc"

# Ruby
alias bi='bundle install'
alias be='bundle exec'
alias berc='be rails console'
alias migrate='be rake db:migrate'
alias ura='gfop && bundle install && bundle exec rake db:migrate db:test:prepare'

# Shell
alias l='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias git='/usr/local/bin/git'

# C++
alias g++11="g++ -std=c++11"

# Kubernetes
alias kc='kubectl'

###########
# Plugins #
###########

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/everest/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/everest/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/everest/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/everest/src/google-cloud-sdk/completion.zsh.inc'; fi
