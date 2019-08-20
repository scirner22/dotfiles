#!/bin/bash

current_dir=$(pwd)

printf "linking bash env config..."
[ -h ~/.bash_aliases ] || ln -s $current_dir/bash_aliases ~/.bash_aliases
[ -h ~/.bash_profile ] || ln -s $current_dir/bash_profile ~/.bash_profile
[ -h ~/.bash_ps_custom ] || ln -s $current_dir/bash_ps_custom ~/.bash_ps_custom
[ -h ~/.tmux.conf ] || ln -s $current_dir/tmux.conf ~/.tmux.conf
[ -h ~/.ssh/config ] || ln -s $current_dir/ssh_config ~/.ssh/config
[ -h ~/.config/nvim/init.vim ] || (mkdir -p ~/.config/nvim && ln -s $current_dir/init.vim ~/.config/nvim/init.vim)
[ -h ~/.gitconfig ] || ln -s $current_dir/gitconfig ~/.gitconfig
[ -h ~/.config/tmuxinator/crossbeam.yml ] || (mkdir -p ~/.config/tmuxinator && ln -s $current_dir/tmuxinator/crossbeam.yml ~/.config/tmuxinator/crossbeam.yml)

[ -f ~/.local/share/nvim/site/autoload/plug.vim ] || curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\nsetup complete!\n"
