shopt -s checkwinsize
shopt -s cdspell
shopt -s cmdhist
shopt -s expand_aliases
shopt -s histappend
shopt -s nocaseglob

[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source ~/.bash_local
source ~/.bash_prompt

for f in ~/.bash_complete/*; do source $f; done

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Turn off Ctrl-s, or vim can't receive this combination
stty -ixon

# Make vim the default editor
export EDITOR="vim"

export HISTCONTROL=ignoreboth
export HISTIGNORE="bg*:fg*:j:l:ll:ls:ls -hal:h:ht:history:gh*:du*:tree:vim:python:cd ..:cd:cd -:ps aux:+:-"
export HISTFILESIZE=100000000000
export HISTSIZE=1000000

export IGNOREEOF=1

alias apt-get='sudo apt-get'
alias ac='apt-cache search --names-only'

alias ls='ls -G'
alias ll='ls -lhoG'
alias l='ll'
alias sl='ls'

alias j='jobs'

alias du='du -h'
alias df='df -h'
alias free='free -mt'
alias dumb="du -h | grep -e '^[0-9.]\+[MGT]\+'"
alias dugb="du -h | grep -e '^[0-9.]\+[GT]\+'"

#find a better way to do this with vim and source
alias x='chmod u+x'
alias tree='tree -Csu'
alias treeex='tree -phDsug'
export GREP_COLOR='1;30;43'
alias grep="grep -i --color"

alias h='history'
alias ht='history | tail -20'

alias dusk='du -msc * | sort -rn'
alias +='pushd .'
alias _='popd'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

alias g='git'
alias v='vim'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag='--color'
else # OS X `ls`
	colorflag='-G'
fi

# List all files colorized in long format
alias ll='ls -lhg ${colorflag}'

# List all files colorized in long format, including dot files
alias la='ls -la ${colorflag}'

# List only directories
alias lsd='ls -l ${colorflag} | grep "^d"'

# Always use color output for `ls`
alias ls='command ls ${colorflag}'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map='xargs -n1'

alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status -s'
alias gss='git status -s'

alias gb='git branch'
alias gba='git branch -vv'
alias gbaa='git branch --all -vv'

alias gc='git checkout'
alias gsl='git stash list'
alias gl='git log --reverse'
alias gls='git log --oneline --reverse -10'
alias gg='git log --graph --oneline --all'
alias co='git checkout'

alias opc='ssh -p 2222 localhost'

alias fg-='fg -'

alias cdd='cd ~/Downloads'

#grep for a string in the source files, then for all files which match grep for a second string within them
function ggrep() {
    find . -name .svn -prune -or -print0 | xargs -r0 grep -li "$1" | xargs grep -li "$2"
}

function bit() {
  local context=${3:-8}
  head -n $(( $2 + $context )) $1 | tail -n $(( $context * 2 ))
}

function separate() {
    python -c "import sys,re; print '$1'.join(re.split('\s*', sys.stdin.read().strip()))";
}

function fname() { find . -iname "*$@*"; }

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

function brew-packages {
    brew list -1 | egrep -v `brew list -1 | xargs brew deps --tree | grep "^|" | egrep -o "\w+$" | sort -u | xargs | sed 's/ /|/g' | sed 's/\(.*\)/(\1)/'`
}

function gh() {
    local args=( "$@" )
    for ((i=0; i<${#args[@]}; i++));
    do
        args[$i]="/${args[$i]}/"
    done

    command=$(printf " && %s" "${args[@]}")
    command=${command:4}
    history | awk "$command"
}

function speed() {
    dd if=/dev/urandom bs=4096 count=1048576 | pv --size 4294967296 | ssh $1 'cat > /dev/null'
}

function git_status_excluding() {
    git -c color.status=false status -s | grep -v ^\ D | grep -v "$@" | cut -b4-
}

# Git diff excluding
function gde() {
    gd `git_status_excluding "$@"`
}


function gbra() {
     local RED='\033[0;31m'
     local GREEN='\033[0;32m'
     local BLUE='\033[0;34m'
     local NC='\033[0m' # No Color
     while read branch; do
       upstream=$(git rev-parse --abbrev-ref $branch@{upstream} 2>/dev/null)
       if [[ $? == 0 ]]; then
         printf "${GREEN}${branch}${NC} tracks ${BLUE}${upstream}${NC}\n"
       else
         printf "${GREEN}${branch}${NC} has ${RED}no upstream${NC} configured\n"
       fi
     done < <(git for-each-ref --format='%(refname:short)' refs/heads/**)
 }
 
 function gsl() {
     local STASH_COLOUR='\033[0;93m'
     local BRANCH_COLOUR='\033[0;36m'
     local DESC_COLOUR='\033[0;35m'
     local NC='\033[0m' # No Color
     git stash list | while IFS=: read STASH BRANCH DESC; do echo -e "${STASH_COLOUR}${STASH}${NC}: ${BRANCH_COLOUR}${BRANCH}${NC} ${DESC_COLOUR}$(echo ${DESC}|cut -c 1-60)${NC}"; git diff --stat $STASH~..$STASH -- | gsed \$d; echo; done 
 }


# git delete branch
function gdel() {
    git checkout master
    git push origin --delete $1
    git branch -D $1
}

# git quick push
function ggg() {
    if [ $# -ne 1 ]; then
        echo "Please supply a commit message (which will also be used as the branch name)"
        return
    fi
    local commit_message="$1"
    local branch_name=`echo "$commit_message" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -d "'"`

    git checkout -b $branch_name upstream/master
    git commit -m "$commit_message"
    git push origin $branch_name
}

# git diff just this branch
function gdb() {
    local branch=`git rev-parse --abbrev-ref HEAD`
    git diff `git merge-base master $branch`..$branch
}

function git_refresh_upstream_repo() {
    echo "fetching and pruning" $1
    git fetch "$1"
    git remote prune "$1"
}

function grefresh() {
    echo 'fetching upstream'
    git fetch upstream

    git_refresh_upstream_repo michael
    git_refresh_upstream_repo ernesto
    git_refresh_upstream_repo kenan
}

function gmake() {
    git checkout -b $1 upstream/master
}

function which() {
    ls -l $(/usr/bin/which $1)
}

function pwf {
  echo "$PWD/$1"
}

function o {
  open ${@:-'.'}
}

function find_by_extension {
  find . -name "*.${1}"
}
alias fe='find_by_extension'
