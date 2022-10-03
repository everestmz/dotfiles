# Everest Munro-Zeisberger zshrc

# Source Prezto.
if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

if [ -v SSH_CONNECTION ]; then
  if [[ $PROMPT == *"${HOST}"* ]]; then
    echo "SSH Prompt set"
  else
    export PROMPT="[${HOST}] ${PROMPT}"
  fi
fi

# Email notifications on the command line? We're in the 21st century!
unset MAILCHECK

# Set the cursor to desired shape:
# echo -e -n "\x1b[\x30 q" # changes to blinking block
# echo -e -n "\x1b[\x31 q" # changes to blinking block also
# echo -e -n "\x1b[\x32 q" # changes to steady block
# echo -e -n "\x1b[\x33 q" # changes to blinking underline
echo -e -n "\x1b[\x34 q" # changes to steady underline
# echo -e -n "\x1b[\x35 q" # changes to blinking bar
# echo -e -n "\x1b[\x36 q" # changes to steady bar

# Import local config if exists
if [ -f $HOME/.zshrc_local ]; then
  echo "Importing configuration from $HOME/.zshrc_local"
  source $HOME/.zshrc_local
else
  echo "No local configuration found in $HOME/.zshrc_local"
fi

# Import utilities
if [ -f $HOME/z/z.sh ]; then
  echo "z found - directory jumping enabled"
  . $HOME/z/z.sh
else
  echo "z not available"
fi

if [ -f ~/.fzf.zsh ]; then
  echo "fzf found - fuzzy finding enabled"
  source ~/.fzf.zsh
elif which fzf > /dev/null; then
  echo "fzf found - fuzzy finding enabled"
else
  echo "fzf not available"
fi

fpath=($HOME/dotfiles/completions $fpath)

###############
# OS-SPECIFIC #
###############
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux stuff
  echo "Loading linux-specific preferences"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS stuff
  echo "Loading macOS-specific preferences"

  # Homebrew Make
  PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

  # Homebrew Curl
  export PATH="/usr/local/opt/curl/bin:$PATH"
else 
  echo "Unknown Operating System - no special preferences loaded"
  # Unknown
fi

###########
# HISTORY #
###########

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=500000

########
# PATH #
########

export PATH=/usr/local/bin:${HOME}/.npm-global/bin:$PATH

# Python
export PATH=$PATH:/Users/everest/anaconda2/bin
export PATH="/usr/local/Cellar/python/2.7.11/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Rust
export PATH="$HOME/.cargo/bin:${PATH}"

# Ruby
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Other Languages
export PATH=$PATH:/Applications/Racket\ v6.9/bin
export PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin/pdflatex
export PATH=$PATH:/Users/everest/Library/Android/sdk/platform-tools
export PATH=$PATH:/usr/local/share/dotnet
export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin

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
alias bmigrate='be rake db:migrate'
alias ura='gfop && bundle install && bundle exec rake db:migrate db:test:prepare'

# Shell
alias l='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias s='sudo'

# C++
alias g++11="g++ -std=c++11"

# Kubernetes
alias kc='kubectl'

# Stuff
alias newpassword='date +%s | shasum | base64 | head -c 32 ; echo'

###########
# Plugins #
###########

# fzf

gpgconf --launch gpg-agent

export PASSWORD_STORE_GPG_OPTS=--no-throw-keyids
