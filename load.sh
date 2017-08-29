#!/bin/bash

current_dir=$(pwd)

printf "\nlinking bash env config...\n"
[ -h ~/.bash_aliases ] || ln -s $current_dir/bash_aliases ~/.bash_aliases
[ -h ~/.bash_profile ] || ln -s $current_dir/bash_profile ~/.bash_profile
[ -h ~/.bash_ps_custom ] || ln -s $current_dir/bash_ps_custom ~/.bash_ps_custom
[ -h ~/.tmux.conf ] || ln -s $current_dir/tmux.conf ~/.tmux.conf
[ -h ~/.ssh/config ] || ln -s $current_dir/ssh_config ~/.ssh/config
[ -h ~/.vimrc ] || ln -s $current_dir/vimrc ~/.vimrc
[ -h ~/.gitconfig ] || ln -s $current_dir/gitconfig ~/.gitconfig

#printf "\ncopying aws utilities...\n"
#ssh core 'mkdir ~/.aws'
#scp ~/.aws/credentials core:~/.aws/credentials

# TODO convert to git checkout and sym links
# printf "\ncopying vim config...\n"
# mkdir -p ~/.vim/autoload ~/.vim/bundle
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git
# #ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-salve.git
# #ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fireplace.git'
# #ssh core 'cd ~/.vim/bundle && git clone git://github.com/guns/vim-clojure-static.git'
# #ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-classpath.git'
# cd ~/.vim/bundle && git clone git://github.com/kien/ctrlp.vim.git
# cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fugitive.git
# cd ~/.vim/bundle && git clone git://github.com/scrooloose/nerdtree.git
# cd ~/.vim/bundle && git clone git://github.com/vim-airline/vim-airline
# cd ~/.vim/bundle && git clone git://github.com/tpope/vim-surround.git
# cd ~/.vim/bundle && git clone git@github.com:derekwyatt/vim-scala.git
# cd ~/.vim/bundle && git clone https://github.com/vim-scripts/paredit.vim
