export EDITOR=vim
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

[ -f ~/.bash_ps_custom     ] && . ~/.bash_ps_custom

cd /opt/code

PATH=$PATH:/home/vagrant:/home/vagrant/bin
