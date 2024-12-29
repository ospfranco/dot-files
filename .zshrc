export ZSH="/Users/osp/.oh-my-zsh"
CASE_SENSITIVE="true"

plugins=(
  zsh-autosuggestions
)

ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  dir
  git
  nvm
  rust
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#00a2ff'

source $ZSH/oh-my-zsh.sh
                  
alias f='open -a Finder ./'                      
alias psa='ps -A'
alias psrep='ps -A | grep $1'
alias hrep='history | grep $1'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
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
alias cev='cd ~/Developer'
alias co='code .'
alias l='eza -l'
alias del='rm -rf'
alias upsub="git pull && git submodule foreach 'git checkout main && git pull'"

my_ip () {
  ifconfig en0 | grep inet | grep -v inet6
}

gac () {
  git add .
  git commit -m "$1"
  git push --quiet
}

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=~/bin:$PATH
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/26.1.10909125
export ANDROID_NDK_ROOT=$ANDROID_HOME/ndk/26.1.10909125
export NDK_HOME=$ANDROID_HOME/ndk/26.1.10909125
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

export PATH=$PATH:/Users/osp/.cargo/bin
export HOMEBREW_NO_ENV_HINTS=1
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home

eval "$(direnv hook zsh)"
