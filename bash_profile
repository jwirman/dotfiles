# alias misc
alias ..="cd .."
alias ...="cd .. ; cd .."
alias ls='ls -G'
alias ll='ls -lG'
alias vim='vim -c :NERDTree'
alias sc='script/console'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'

# alias bundler
alias bi='bundle install --path vendor/bundle --binstubs'
alias bu='bundle update'
alias bp='bundle package'
alias be='bundle exec'
alias binit="bi && bp && echo 'vendor/bundle' >> .gitignore"

# alias for git stuff
alias gs='git status '
alias gsl='git stash list'
alias gsp='git stash pop'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
#alias gx='gitx --all'
alias gpfull='git pull && bundle && rake db:drop db:create:all db:migrate; rake db:seed; rake db:test:prepare test:hot:db:prepare; rake assets:clean RAILS_ENV=test; time rake test:hot && say done'

# environment variables
#USER="justin"
#LOGNAME="justin"
#GREP_OPTIONS="--exclude-dir=\.svn"
#SVN_EDITOR="vi"
EDITOR="vim"
PS1="[\u@local:\W:(\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))]\$ "
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
shopt -s histappend
#export GREP_OPTIONS SVN_EDITOR USER LOGNAME PS1 HISTCONTROL HISTSIZE
export EDITOR PS1 HISTCONTROL HISTSIZE
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules
# REE for LivingSocial
#export RUBY_HEAP_FREE_MIN=1024
#export RUBY_HEAP_MIN_SLOTS=4000000
#export RUBY_HEAP_SLOTS_INCREMENT=250000
#export RUBY_GC_MALLOC_LIMIT=500000000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# needed for C compiler capable of building REE
#export ARCHFLAGS='-arch x86_64'
#export CC=/usr/bin/gcc-4.2

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# make prompt version control aware
source ~/src/dotfiles/bash_vcs.sh

# use vi mode for bash readline
set -o vi
