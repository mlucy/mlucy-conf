. ~/.bashrc_default
export TERM=xterm-256color
export LANG=en_US.UTF-8
export PATH=~/bin:~/go/bin:$PATH:~/kubernetes/platforms/linux/amd64

shopt -s histappend
shopt -s cmdhist
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'

export NVM_DIR="/home/mlucy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
source '/home/mlucy/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/mlucy/google-cloud-sdk/completion.bash.inc'
