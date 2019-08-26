export EDITOR=nvim
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export GOPATH=${HOME}/go

export FIGURE_HOME_DIR=${HOME}/figure
export FIGURE_CODE_DIR=${FIGURE_HOME_DIR}/code

export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

#[ -f ~/.bash_ps_custom ] && . ~/.bash_ps_custom
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_secrets ] && . ~/.bash_secrets
[ -f ~/.bash_tokens ] && . ~/.bash_tokens
[ -f ~/.bash-git-prompt/gitprompt.sh ] && . ~/.bash-git-prompt/gitprompt.sh

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source <(kubectl completion bash)
  source $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
