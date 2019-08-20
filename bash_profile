export EDITOR=nvim
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export RUST_SRC_PATH=${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

export GOPATH=${HOME}/go

export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

export CROSSBEAM_CODE_DIR=${HOME}/Documents/code
export CROSSBEAM_PUBKEY_NAME=stevecirner@stevecirner-system76
export CROSSBEAM_PUBKEY_FILE=~/.ssh/id_rsa.pub
export CROSSBEAM_DEV_AUTH0_ID='google-oauth2|112493139891641366086'

export PATH="$CROSSBEAM_CODE_DIR/devops/bin:$PATH"
export PATH=$PATH:~/.lein/bin

#[ -f ~/.bash_ps_custom ] && . ~/.bash_ps_custom
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_secrets ] && . ~/.bash_secrets
[ -f ~/.bash_tokens ] && . ~/.bash_tokens
[ -f ~/.bash-git-prompt/gitprompt.sh ] && . ~/.bash-git-prompt/gitprompt.sh

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
