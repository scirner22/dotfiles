#!/bin/bash

current_dir=$(pwd)

printf "linking bash env config..."
[ -h ~/.bash_aliases ] || ln -s $current_dir/bash_aliases ~/.bash_aliases
[ -h ~/.bash_profile ] || ln -s $current_dir/bash_profile ~/.bash_profile
[ -h ~/.bash_ps_custom ] || ln -s $current_dir/bash_ps_custom ~/.bash_ps_custom
[ -h ~/.tmux.conf ] || ln -s $current_dir/tmux.conf ~/.tmux.conf
[ -h ~/.ssh/config ] || ln -s $current_dir/ssh_config ~/.ssh/config
[ -h ~/.ideavimrc ] || ln -s $current_dir/ideavimrc ~/.ideavimrc
[ -h ~/.config/nvim/init.vim ] || (mkdir -p ~/.config/nvim && ln -s $current_dir/init.vim ~/.config/nvim/init.vim)
[ -h ~/.gitconfig ] || ln -s $current_dir/gitconfig ~/.gitconfig
[ -h ~/.config/tmuxinator/crossbeam.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/crossbeam.yml ~/.config/tmuxinator/crossbeam.yml)
[ -h ~/.config/tmuxinator/figure.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/figure.yml ~/.config/tmuxinator/figure.yml)
[ -h ~/.config/tmuxinator/blockchain.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/blockchain.yml ~/.config/tmuxinator/blockchain.yml)
[ -h ~/.config/alacritty/alacritty.yml ] || (mkdir -p ~/.config/alacritty && ln -s $current_dir/alacritty.yml ~/.config/alacritty/alacritty.yml)
[ -h ~/.config/fish/config.fish ] || (mkdir -p ~/.config/fish && ln -s $current_dir/config.fish ~/.config/fish/config.fish)

[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TODO install cargo
# install rg

printf "\nsetup complete!\n"
