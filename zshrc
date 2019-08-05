# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rails brew bundler git-flow rails3)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=$PATH:$HOME/bin:$HOME/node_modules/.bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export NODE_PATH=/opt/local/lib/node_modules

alias ls='ls -G'
alias ll='ls -lG'
alias vim='vim -c :NERDTree'

#USER="justin.wirman"
#LOGNAME="justin.wirman"
#GREP_OPTIONS="--exclude-dir=\.svn"
#SVN_EDITOR="vi"
HISTCONTROL=erasedups
HISTSIZE=10000
shopt -s histappend
#export GREP_OPTIONS SVN_EDITOR USER LOGNAME HISTCONTROL HISTSIZE
export HISTCONTROL HISTSIZE
