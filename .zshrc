export ZSH="/Users/osp/.oh-my-zsh"
export TERM="xterm-256color"

ZSH_THEME="frisk"
CASE_SENSITIVE="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# Preferred editor for local and remote sessions
export EDITOR='nano'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

#--------------------------------
# DAY TO DAY ALIASES
#--------------------------------
alias ll='ls -FGlAhp' 			           # List directory
alias ..='cd ../'                      # Go back 1 directory level
alias f='open -a Finder ./'		         # Open directory in finder
alias c='clear'                        # c: Clear terminal display
alias psa='ps -A'                      # ps with -A flag
alias psag='ps -A | grep $1'           # Search through running processes
alias hrep='history | grep $1'         # Search through typed history
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"  # Output tree view

#-------------------------------
# GIT FU
#-------------------------------
alias gpp='git pull'
alias gpr='git pull --rebase'
alias gs='git status '
alias ga='git add '
alias gaa='git add .'
alias gb='git branch '
alias gc='git commit -m'
alias gd='git diff'
alias gp='git push'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias grim='git rebase -i master'


#-----------------------
# SAVING MYSELF SOME TIME
#-----------------------
alias dev='cd ~/dev'

#------------------------
# SUBROUTINES
#------------------------

#  my_ip: Get's current IP address
my_ip () {
  ifconfig en0 | grep inet | grep -v inet6
}

# gac: git add . and git commit rolled up into one
gac () {
  git add .
  git commit "$1"
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


export PATH=$PATH:~/bin
export ANDROID_HOME=/Users/osp/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$PATH"


export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# configuration for rust
export PATH="$HOME/.cargo/bin:$PATH" 

# volta
export VOLTA_HOME="/Users/osp/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"
