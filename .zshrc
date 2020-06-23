export ZSH="/Users/osp/.oh-my-zsh"
CASE_SENSITIVE="true"

plugins=(
  zsh-autosuggestions
)

# PROMPT=$'
# %{$fg[white]%}%*%{$reset_color%} - %{$fg[white]%}%n@%m%{$reset_color%} %{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)
# '

PROMPT=$'
%{$fg[blue]%}%/%{$reset_color%} %{$fg[white]%}%n@%m%{$reset_color%} $(git_prompt_info)
'

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

#--------------------------------
# DAY TO DAY ALIASES
#--------------------------------
alias ll='ls -FGlAhp'                              # List directory
alias ..='cd ../'                      # Go back 1 directory level
alias f='open -a Finder ./'                      # Open directory in finder
alias psa='ps -A'                      # ps with -A flag
alias psrep='ps -A | grep $1'           # Search through running processes
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
alias cev='cd ~/dev'

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
  git commit -m "$1"
  git push
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