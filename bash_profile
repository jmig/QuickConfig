# Couleurs du préfix du terminal
NM="\[\033[0;38m\]"
HI="\[\033[0;37m\]"
HII="\[\033[0;36m\]"
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

export PS1='\[\e[1;37m\][\[\e[0;37m\]\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;36m\]\w\[\e[1;33m\]$(parse_git_branch)\[\e[1;37m\]]$ \[\e[0m\]'

# Alias
alias ls='ls -hF'
alias ll='ls -lAhF'
alias cd..="cd .."
alias c="clear"
alias grep='grep -n'

# Environment Vars
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# PATH
export PATH="/usr/local/pear/bin:$PATH"
