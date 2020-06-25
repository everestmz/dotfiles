# Everest Munro-Zeisberger zshrc
# Source Prezto.

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi
export PATH=/usr/local/bin:$PATH

. $HOME/z/z.sh

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
  # Unknown
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

# Rust
export PATH="$HOME/.cargo/bin:${PATH}"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Languages
export PATH=$PATH:/Applications/Racket\ v6.9/bin
export PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin/pdflatex
export PATH=$PATH:/Users/everest/Library/Android/sdk/platform-tools
export PATH=$PATH:/usr/local/share/dotnet
export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/everest/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/everest/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/everest/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/everest/src/google-cloud-sdk/completion.zsh.inc'; fi

gpgconf --launch gpg-agent

