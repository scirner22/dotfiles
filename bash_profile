export EDITOR=nvim
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export GOPATH=${HOME}/go

export FIGURE_HOME_DIR=${HOME}/figure
export FIGURE_CODE_DIR=${FIGURE_HOME_DIR}/code
export FIGURE_DEV_DIR=${FIGURE_CODE_DIR}/dev-utils
export CONFIG_HOME="~/Library/Application\ Support"

export TESTNET_URI="https://rpc.test.provenance.io:443"
export MAINNET_URI="https://rpc.provenance.io:443"

export KUBE_SORT="--sort-by=.metadata.creationTimestamp"
export KUBE_NODE_TAINTS="-o custom-columns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers"
export KUBE_SORT_RESTART='--sort-by=".status.containerStatuses[0].restartCount"'
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export OKTA_ORG_NAME="figure"
export OKTA_BASE_URL="okta.com"

export PIO_HOME="/Users/stephencirner/figure/code/provenance"

export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$FIGURE_DEV_DIR/bin

# exchange-ops
export GAR_HOST=us-east1-docker.pkg.dev
export GCR_PROJECT=figure-development

# configure libarchive
export LDFLAGS="-L/usr/local/opt/libarchive/lib"
export CPPFLAGS="-I/usr/local/opt/libarchive/include"
export PKG_CONFIG_PATH=/usr/local/opt/libarchive/lib/pkgconfig

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
export PATH="$HOME/.vector/bin:$PATH"

# export CLOUDSDK_PYTHON=python2
#
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stephencirner/google-cloud-sdk/path.bash.inc' ]; then . '/Users/stephencirner/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stephencirner/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/stephencirner/google-cloud-sdk/completion.bash.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/stephencirner/.sdkman"
[[ -s "/Users/stephencirner/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/stephencirner/.sdkman/bin/sdkman-init.sh"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
