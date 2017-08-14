#!/bin/bash

current_dir=$(pwd)
#core_dir=$1
printf "\ncopying config\n"

#cd $core_dir

printf "\ncopying bash env config...\n"
cp $current_dir/bash_aliases ~/.bash_aliases
cp $current_dir/bash_profile ~/.bash_profile
cp $current_dir/bash_ps_custom ~/.bash_ps_custom
cp $current_dir/tmux.conf ~/.tmux.conf
cp $current_dir/ssh_config ~/.ssh/config

#printf "\ncopying aws utilities...\n"
#ssh core 'mkdir ~/.aws'
#scp ~/.aws/credentials core:~/.aws/credentials

printf "\ncopying vim config...\n"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git
#ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-salve.git
#ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fireplace.git'
#ssh core 'cd ~/.vim/bundle && git clone git://github.com/guns/vim-clojure-static.git'
#ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-classpath.git'
cd ~/.vim/bundle && git clone git://github.com/kien/ctrlp.vim.git
cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fugitive.git
cd ~/.vim/bundle && git clone git://github.com/scrooloose/nerdtree.git
cd ~/.vim/bundle && git clone git://github.com/vim-airline/vim-airline
cd ~/.vim/bundle && git clone git://github.com/tpope/vim-surround.git
cd ~/.vim/bundle && git clone https://github.com/vim-scripts/paredit.vim
cp $current_dir/vimrc ~/.vimrc
