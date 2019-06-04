export ZSH="/Users/osp/.oh-my-zsh"
export TERM="xterm-256color"

# ZSH_THEME="blinks"
ZSH_THEME="bullet-train"
CASE_SENSITIVE="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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
# GIT DUH
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

#function my_ip() # get IP adresses
my_ip () {
  ifconfig en0 | grep inet | grep -v inet6
}

stop_all_docker_containers() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}

kill_codehelper () {
  ps aux | grep "Code Helper" | grep -v "grep" | awk '{print $2}' | xargs kill
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

export NVM_DIR="/Users/osp/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#export ANDROID_HOME=/Users/osp/Library/Android/sdk
#export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH=$PATH:~/bin
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion