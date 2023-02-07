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
# added by Anaconda3 installer
export PATH="/home/mlucy/anaconda3/bin:$PATH"
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# added by Anaconda3 installer
# export PATH="$CUDA_HOME/bin:/home/mlucy/anaconda3/bin:$PATH"
export CUDA_HOME=/usr/local/cuda-8.0
export PATH="$CUDA_HOME/bin:~/ve/proxy/bin:$PATH"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
# source <(k completion bash | sed 's/__start_kubectl kubectl/__start_kubectl k/')

export GOOGLE_APPLICATION_CREDENTIALS=/home/mlucy/dbox/leadgenie-code/scraper/credentials/basilica-9bee2d05a57e.json
export PATH=/opt/homebrew/bin:$PATH
export COLORTERM=
