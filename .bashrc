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
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
