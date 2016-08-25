DULL=0
BRIGHT=1

_bold=$(tput bold)
_normal=$(tput sgr0)

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

##
# ANSI Escape Commands
##
ESC="\033"
NORMAL="\[$ESC[m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

##
# Shortcuts for Colored Text ( Bright and FG Only )
##

# DULL TEXT

BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
CYAN="\[$ESC[${DULL};${FG_CYAN}m\]"
WHITE="\[$ESC[${DULL};${FG_WHITE}m\]"

# BRIGHT TEXT
BRIGHT_BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
BRIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
BRIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
BRIGHT_YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
BRIGHT_VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
BRIGHT_CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
BRIGHT_WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"

# REV TEXT as an example
REV_CYAN="\[$ESC[${DULL};${BG_WHITE};${BG_CYAN}m\]"
REV_RED="\[$ESC[${DULL};${FG_YELLOW}; ${BG_RED}m\]"

BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
LIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
LIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"
LIGHT_GRAY="\[$ESC[${DULL};${FG_WHITE}m\]"

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function check_git_changes {
    var=`git status 2> /dev/null | sed -e '/working tree clean$/!d' | wc -l`
    if [ $var -ne 1 ]; then
        tput setaf 1 # red
    else
        tput setaf 2 # green
    fi
}

function detect_vcs {
    VCS=''
    git_dir() {
        base_dir=$(git rev-parse --show-cdup 2>/dev/null) || return 1
        VCS='git'

        if [ -n "$base_dir" ]; then
          base_dir=`cd $base_dir; pwd`
        else
          base_dir=$PWD
        fi

        vcs_branch=$(parse_git_branch)

    }

    #svn_dir() {
    #    [ -d ".svn" ] || return 1
    #    VCS='svn'
    #    # while [ -d "$base_dir/../.svn" ]; do base_dir="$base_dir/.."; done
    #    # base_dir=`cd $base_dir; pwd`
    #    vcs_branch=$(svn info "$base_dir" | awk '/^URL/ { sub(".*/","",$0); r=$0 } /^Revision/ { sub("[^0-9]*","",$0); print r":"$0 }')

    #    alias pull="svn up"
    #    alias commit="svn commit"
    #    alias push="svn ci"
    #    alias revert="svn revert"
    #}

    git_dir #|| svn_dir

    if [ -n "$VCS" ]; then
      #alias st="$VCS status"
      #alias d="$VCS diff"
      #alias up="pull"
      __vcs_prefix="($VCS)"
      __vcs_branch_tag="[$vcs_branch]"
    else
      __vcs_prefix=''
      __vcs_branch_tag=''
    fi

    base_dir="$(basename "${base_dir}")"
    __cwd=${PWD/$HOME/'~'}
    __cwd="$(basename "${__cwd}")"
    __cwd=${__cwd/$base_dir/\/}
}

function prompt {    
    PROMPT_COMMAND=detect_vcs
    #PS1="$CYAN\u$NORMAL@$GREEN\h:$GREEN\${__vcs_prefix}$CYAN\${base_dir}\[\$(check_git_changes)\]\${__vcs_branch_tag}$CYAN\${__cwd}$NORMAL \$ "
    PS1="$CYAN\u$NORMAL@$CYAN\${base_dir}\[\$(check_git_changes)\]\${__vcs_branch_tag}$CYAN\${__cwd}$NORMAL \$ "
  # PS2='> '
  # PS4='+ '
}
prompt
