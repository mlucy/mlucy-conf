. ~/.bashrc_default
export TERM=xterm-256color
export LANG=en_US.UTF-8
export PATH=~/bin:~/go/bin:/usr/local/bin:$PATH:~/kubernetes/platforms/linux/amd64

shopt -s histappend
shopt -s cmdhist
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'

export PATH=/usr/local/bin:$PATH
. /Users/mlucy/.rbenvrc
. ~/.stripe-repos.sh
