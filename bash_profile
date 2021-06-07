export EDITOR=nvim
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export GOPATH=${HOME}/go

export FIGURE_HOME_DIR=${HOME}/figure
export FIGURE_CODE_DIR=${FIGURE_HOME_DIR}/code
export FIGURE_DEV_DIR=${FIGURE_CODE_DIR}/dev-utils
export CONFIG_HOME="~/Library/Application\ Support"

export TESTNET_URI="tcp://rpc-0.test.provenance.io:26657"
export MAINNET_URI="tcp://rpc-0.provenance.io:26657"

export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$FIGURE_DEV_DIR/bin

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

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export CLOUDSDK_PYTHON=python2

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/stephencirner/.sdkman"
[[ -s "/Users/stephencirner/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/stephencirner/.sdkman/bin/sdkman-init.sh"
