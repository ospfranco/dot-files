# Oscar Franco, 19 Mar 2017, Munich, Germany

#--------------------------------
#ENVIROMENT CONFIGURATION
#--------------------------------

#ADD YOUR OWN PATHS HERE
# export ANDROID_HOME=/usr/local/opt/android-sdk
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# export NVM_DIR="/Users/osp/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# update yarn
# curl -o- -L https://yarnpkg.com/install.sh | bash
# export PATH="$HOME/.yarn/bin:$PATH"

# don't put duplicate lines in the history or force ignoredups and ignorespace                                                                                                                                 
HISTCONTROL=ignoredups:ignorespace                                                                                              
# append to the history file, don't overwrite it    
shopt -s histappend                                                                                                                                                                                                        
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)                                                                                                     
HISTSIZE=100000                                       
HISTFILESIZE=200000

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[36m\]\u@\h / \[\e[0m\]\[\e[32m\]\w /\[\e[33m\]\$(parse_git_branch) >\[\e[00m\] \n"

export GREP_OPTIONS='--color=auto'


#--------------------------------
#ALIASES
#--------------------------------
alias ll='ls -FGlAhp' 			    # List directory
alias ..='cd ../'                   # Go back 1 directory level
alias f='open -a Finder ./'		    # Open directory in finder
alias c='clear'                     # c: Clear terminal display

#-------------------------------
#GIT ALIASES
#-------------------------------
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias grim='git rebase -i master'

#------------------------
# SUBROUTINES
#------------------------

#function my_ip() # get IP adresses
my_ip () {
    ifconfig en0 | grep inet | grep -v inet6
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
