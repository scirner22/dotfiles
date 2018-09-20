export EDITOR=nvim
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export RUST_SRC_PATH=${HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

export GOPATH=${HOME}/go

export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

#[ -f ~/.bash_ps_custom ] && . ~/.bash_ps_custom
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_secrets ] && . ~/.bash_secrets
[ -f ~/.bash_tokens ] && . ~/.bash_tokens
[ -f ~/.bash-git-prompt/gitprompt.sh ] && . ~/.bash-git-prompt/gitprompt.sh

export PATH="$HOME/.cargo/bin:$PATH"
