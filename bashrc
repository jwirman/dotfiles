umask 002 # permissions for new files/directories

shopt -s histappend

# environment variables
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export EDITOR='vim'
#export GREP_OPTIONS='--color=auto --exclude-dir=\.git'  # no longer supported
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export LESS="-ErX"
#export PS1="[\u@local:\W:(\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))]\$ "
#export PATH=~/homebrew/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=.bundle/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules
#export RUBY_HEAP_MIN_SLOTS=4000000
#export RUBY_HEAP_SLOTS_INCREMENT=250000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=500000000
#export RUBY_HEAP_FREE_MIN=1024
# needed for C compiler capable of building REE
#export ARCHFLAGS='-arch x86_64'
#export CC=/usr/bin/gcc-4.2

# misc
alias ..="cd .."
alias ...="cd .. ; cd .."
alias c='clear'
#alias ls='ls -G'
#alias ll='ls -lG'
alias ll='ls -la'
alias vi='vim -c :NERDTreeClose'
alias vim='vim -c :NERDTree'
#alias gvim='/homebrew/Cellar/macvim/7.3-64/MacVim.app/Contents/MacOS/Vim -g'
#alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -gc NERDTree'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias tail='tail -f log/development.log'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
alias psef='ps -ef | grep'
alias rtags="find . -name '*.rb' | xargs ctags -a"
#alias stalk='ps auxwww | head -n 1; ps auxwww | grep -v "grep -i" | grep -i '

alias whatsmyip='curl ipinfo.io'
# Opens current branch in github
alias github='open https://github.com/IDme/$(basename `git rev-parse --show-toplevel`)/tree/$(git rev-parse --abbrev-ref HEAD)'
# Opens current branch in jira
alias jira='function _jira(){ open https://idmeinc.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD); };_jira'

# ID.me apps
alias hlp='cd ~/src/IDme/services_user/idme-hosted-pages/'
alias iva='cd ~/src/IDme/services_core/idme-verification/'
alias diva='cd ~/src/IDme/services_core/disney-verification/'
alias mgm='cd ~/src/IDme/services_core/mgm-verification/'
alias idp='cd ~/src/IDme/services_core/idme-idp/'
alias admin='cd ~/src/IDme/services_core/idme-admin/'
alias sup='cd ~/src/IDme/services_core/idme-support/'
alias data='cd ~/src/IDme/services_core/idme-data/'
alias td='cd ~/src/IDme/services_internal/idme-test-drive/'
alias capt='cd ~/src/IDme/devops/captain-deploy/'
alias arcs='cd ~/src/IDme/services_internal/idme-arcs/'
alias wal='cd ~/src/IDme/services_user/idme-wallet/'
alias shop='cd ~/src/IDme/services_user/idme-marketplace/'

# bundler
alias b='bundle'
alias bi='b install --path .bundle --binstubs .bundle/bin'
alias bil='bi --local'
alias bu='b update'
alias bp='b package'
alias be='b exec'
alias binit="bi && bp && echo 'vendor/bundle' >> .gitignore"

# git stuff
alias gs='git status'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias go='git checkout'
alias gk='gitk --all&'
alias gpr='git pull --rebase'
alias gp='git pull'
alias grc='git rebase --continue'
alias prp='git pull --rebase && git push'
alias gg='git grep --break --heading $1'
alias gx='gitx --all'
#alias gpfull='git pull && bundle && rake db:drop db:create:all db:migrate; rake db:seed; rake db:test:prepare test:hot:db:prepare; rake assets:clean RAILS_ENV=test; time rake test:hot && say done'
alias gsu='git submodule update --init'
alias log="git log --author=jwirman"
alias del_local="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d"

# cucumber
alias bcuke='bundle exec cucumber -p browser'
alias hcuke='bundle exec cucumber -p headless'
alias f='cucumber --no-profile --autoformat tmp'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# alias git to hub to use git shorthand
eval "$(hub alias -s)"

# bash completion and git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# use vi mode for bash readline
set -o vi

function km {
  ps aux | grep $1 | awk '{print $2}' | xargs kill
}

# make prompt version control aware
source ~/.bash_vcs.sh
# tmux completion
source ~/.tmuxinator/tmuxinator.bash
# amazon cli completion
complete -C aws_completer aws
