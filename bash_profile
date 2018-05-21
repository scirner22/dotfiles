export EDITOR=nvim
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export TERM=screen-256color
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M "
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export RUSTC_WRAPPER=~/.cargo/bin/sccache
export BF_BASE_DIR=~/Documents/blackfynn

[ -f ~/.bash_ps_custom ] && . ~/.bash_ps_custom
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_tokens ] && . ~/.bash_tokens
[ -f ~/.blackfynnrc ] && . ~/.blackfynnrc
[ -f $BF_BASE_DIR/cli-utils/assume_role.sh ] && . $BF_BASE_DIR/cli-utils/assume_role.sh
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source <(helm completion bash)

cd $BF_BASE_DIR
