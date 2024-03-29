#!/bin/bash
set -ex

current_dir=$(pwd)

[ -h ~/.aliases ] || ln -s $current_dir/aliases ~/.aliases
# [ -h ~/.bash_profile ] || ln -s $current_dir/bash_profile ~/.bash_profile
[ -h ~/.git_prompt ] || ln -s $current_dir/git_prompt ~/.git_prompt
[ -h ~/.tmux.conf ] || ln -s $current_dir/tmux.conf ~/.tmux.conf
[ -h ~/.ssh/config ] || ln -s $current_dir/ssh_config ~/.ssh/config
[ -h ~/.ideavimrc ] || ln -s $current_dir/ideavimrc ~/.ideavimrc
[ -h ~/.config/nvim/init.vim ] || (mkdir -p ~/.config/nvim && ln -s $current_dir/init.vim ~/.config/nvim/init.vim)
[ -h ~/.gitconfig ] || ln -s $current_dir/gitconfig ~/.gitconfig
# [ -h ~/.config/tmuxinator/crossbeam.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/crossbeam.yml ~/.config/tmuxinator/crossbeam.yml)
[ -h ~/.config/tmuxinator/figure.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/figure.yml ~/.config/tmuxinator/figure.yml)
# [ -h ~/.config/tmuxinator/blockchain.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/blockchain.yml ~/.config/tmuxinator/blockchain.yml)
# [ -h ~/.config/tmuxinator/p8e.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/p8e.yml ~/.config/tmuxinator/p8e.yml)
# [ -h ~/.config/tmuxinator/pay.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/pay.yml ~/.config/tmuxinator/pay.yml)
[ -h ~/.config/alacritty/alacritty.toml ] || (mkdir -p ~/.config/alacritty && ln -s $current_dir/alacritty.toml ~/.config/alacritty/alacritty.toml)
[ -h ~/.config/fish/config.fish ] || (mkdir -p ~/.config/fish && ln -s $current_dir/config.fish ~/.config/fish/config.fish)

[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TODO install cargo

cargo install ripgrep

# install docker
# install alacritty
# install brew

brew tap homebrew/cask-fonts

brew install neovim
brew install tmux
brew install tmuxinator
brew install font-noto-sans-mono
brew install kubectx
brew install node

mkdir -p ~/.tmux
[ -d ~/.tmux/kube-tmux ] || git clone https://github.com/jonmosco/kube-tmux ~/.tmux/kube-tmux

# install go
# curl -s "https://get.sdkman.io" | bash
