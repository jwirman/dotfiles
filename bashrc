umask 002

shopt -s histappend

export JAVA_HOME=/Library/Java/Home
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR='vim'
export GREP_OPTIONS='--color=auto'
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/lib/instantclient/"
export DISPLAY=':2.0'
export PATH=~/homebrew/bin:$PATH
export LESS="-erX"
export RUBY_HEAP_MIN_SLOTS=4000000
export RUBY_HEAP_SLOTS_INCREMENT=320000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_FREE_MIN=100000
export HISTSIZE=10000

alias ll='ls -la'
alias ss='script/server'
alias sc='script/console'
alias pr='git pull --rebase'
alias gg='git grep --break --heading $1'
alias unicorn='unicorn_rails -p3000'
alias gvim='/homebrew/Cellar/macvim/7.3-64/MacVim.app/Contents/MacOS/Vim -g'
alias vv='/Applications/MacVim.app/Contents/MacOS/Vim -gc NERDTree'
alias bcuke='bundle exec cucumber -p browser'
alias b='bundle'
alias bi='b install --path vendor/bundle --binstubs'
alias bil='bi --local'
alias bu='b update'
alias be='b exec'
alias bp='b package'
alias hcuke='bundle exec cucumber -p headless'
alias f='cucumber --no-profile --autoformat tmp'
alias rtags="find . -name '*.rb' | xargs ctags -a"
alias psef='ps -ef | grep'
alias stalk='ps auxwww | head -n 1; ps auxwww | grep -v "grep -i" | grep -i '
alias prp="git pull --rebase && git push"

alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias go="git checkout"
alias ga="git add"
alias gb="git branch"
alias gsu="git submodule update --init"
alias log="git log --author=jwirman"
alias bi="bundle install"

if [ -f /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Use this for user-specific settings that you don't want checked in.
if [ -f ~/.profile ]; then
  source ~/.profile
fi

function km {
  ps aux | grep $1 | awk '{print $2}' | xargs kill
}

source ~/.bash_vcs.sh
