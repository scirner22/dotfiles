export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M "

[ -f ~/.bash_ps_custom ] && . ~/.bash_ps_custom
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.blackfynnrc ] && . ~/.blackfynnrc
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash

#PATH=$PATH:/usr/local/etc

cd ~/Documents/blackfynn
