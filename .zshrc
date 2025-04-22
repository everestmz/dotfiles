# Everest Munro-Zeisberger zshrc

# Source Prezto.
# if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
#   source "$HOME/.zprezto/init.zsh"
# fi

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

# Import utilities
if [ -f $HOME/z/z.sh ]; then
  . $HOME/z/z.sh
else
fi

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
elif which fzf > /dev/null; then
else
  echo "fzf not installed"
fi

fpath=($HOME/dotfiles/completions $fpath)

###############
# OS-SPECIFIC #
###############
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux stuff
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS stuff

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
export PATH=$HOME/bin:$PATH

# Rust
export PATH="$HOME/.cargo/bin:${PATH}"

# Ruby
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# FLy.io
export FLYCTL_INSTALL="${HOME}/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"

# Helix
export HELIX_CONFIG=${HOME}/.config/helix/config.toml
export HELIX_LANG=${HOME}/.config/helix/languages.toml

###########
# Aliases #
###########

# Git
alias gd="git diff"
alias gr="git rebase"
alias grass="git rebase -i --autostash --autosquash"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

alias gl="git log"
alias glo="git log --oneline"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcnv="git commit --no-verify"
alias gcn="git commit --no-verify"
alias gp="git push"
alias gph="git push -u origin HEAD"
alias gphf="git push -u origin +HEAD"
alias gb="git branch"
alias gco="git checkout"
alias gfo='git fetch --prune origin'
alias gform="git fetch --prune && git rebase origin/master"
alias gfrom="git fetch --prune && git rebase origin/master"
alias gfromast="gfrom --autostash"
alias gfromasq="gfrom --autosquash"
alias gfromaa="gfrom --autostash --autosquash"

alias gf="vim -c :G"

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

# Plan
alias pa="plan add"
alias pd="plan done"
alias ppd="plan pickdone"
alias pad="plan did" # basically plan-add-done
alias pl="plan list"
alias pm="plan mode"
alias pms="plan showmode"
alias pc="plan closeout"

# C++
alias g++11="g++ -std=c++11"

# Kubernetes
alias kc='kubectl'

# Stuff
alias newpassword='date +%s | shasum | base64 | head -c 32 ; echo'

# Keyboard Dev
alias mountfat="sudo mount -t vfat -o rw,uid=$(id -u),gid=$(id -g)"

#########
# Local #
########

# Import local config if exists
# We do this at the end to allow local to override PATH and other vars  
if [ -f $HOME/.zshrc_local ]; then
  source $HOME/.zshrc_local
else
  echo "No local configuration found in $HOME/.zshrc_local"
fi


#########
# Stuff #
#########

export PASSWORD_STORE_GPG_OPTS=--no-throw-keyids

##########
# STARSHIP

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  echo "starship not installed - defaulting to standard shell"
fi

###########################
# TODO: need to make this work on linux too
# this plugin enables the substring search (vs the default beginning search only)
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
plugins=(zsh-history-substring-search ssh-agent)

# NOTE: heavily copied from the history-search-end function, just modified to work with the substring-search plugin
substring-search-end() {
  integer cursor=$CURSOR mark=$MARK

  if [[ $LASTWIDGET = *-substring-search-*-end ]]; then
    CURSOR=$MARK
  else
    MARK=$CURSOR
  fi

  # Remove -end from widget name to get the base plugin widget
  if zle ${WIDGET%-end}; then
    zle end-of-line
  else
    CURSOR=$cursor
    MARK=$mark
    return 1
  fi
}

# Name our widgets to match the plugin's pattern, just adding -end
zle -N history-substring-search-up-end substring-search-end
zle -N history-substring-search-down-end substring-search-end

bindkey "^[[A" history-substring-search-up-end
bindkey "^[[B" history-substring-search-down-end
##########################

# Try to find and source zsh-syntax-highlighting
potential_paths=(
  "/opt/homebrew/share/zsh-syntax-highlighting"              # macOS ARM
  "/usr/local/share/zsh-syntax-highlighting"                 # macOS Intel
  "/usr/share/zsh-syntax-highlighting"                       # Many Linux distros
  "/usr/share/zsh/plugins/zsh-syntax-highlighting"           # Arch Linux
  "${HOME}/.zsh/zsh-syntax-highlighting"                     # Manual installation
)

found_highlighting=false
for potential in "${potential_paths[@]}"; do
  if [[ -d "$potential" ]]; then
    ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$potential/highlighters"
    source "$potential/zsh-syntax-highlighting.zsh"

    # Configure colors for command validation
    ZSH_HIGHLIGHT_STYLES[command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
    found_highlighting=true
    break
  fi
done

if [[ "$found_highlighting" = false ]]; then
  echo "zsh-syntax-highlighting not installed"
fi
