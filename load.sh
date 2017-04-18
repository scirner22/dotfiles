#!/bin/bash

current_dir=$(pwd)
core_dir=$1
printf "\ncopying config to core vm at $core_dir\n"

cd $core_dir

printf "copying gpg config.."
rsync -avP ~/.gnupg core:

printf "\ncopying bash env config...\n"
scp $current_dir/bash_aliases core:~/.bash_aliases
scp $current_dir/bash_profile core:~/.bash_profile
scp $current_dir/bash_ps_custom core:~/.bash_ps_custom
scp $current_dir/tmux.conf core:~/.tmux.conf
scp $current_dir/ssh_config core:~/.ssh/config

printf "\ncopying aws utilities...\n"
scp $current_dir/get-role-token core:~/get-role-token
ssh core 'sudo ln -sf ~/get-role-token /usr/local/bin/get-role-token'
ssh core 'sudo chmod 0755 ~/get-role-token'
scp $current_dir/aws-assume-role.sh core:~/aws-assume-role.sh
ssh core 'sudo ln -sf ~/aws-assume-role.sh /usr/local/bin/aws-assume-role.sh'
ssh core 'sudo chmod 0755 ~/aws-assume-role.sh'
ssh core 'mkdir ~/.aws'
scp ~/.aws/credentials core:~/.aws/credentials

printf "\ncopying vim config...\n"
ssh core 'mkdir -p ~/.vim/autoload ~/.vim/bundle'
ssh core 'curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-salve.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fireplace.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/guns/vim-clojure-static.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-classpath.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/kien/ctrlp.vim.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fugitive.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/scrooloose/nerdtree.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/vim-airline/vim-airline'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-surround.git'
ssh core 'cd ~/.vim/bundle && git clone git://github.com/kchmck/vim-coffee-script.git'
ssh core 'cd ~/.vim/bundle && git clone https://github.com/vim-scripts/paredit.vim'
scp $current_dir/vimrc core:~/.vimrc
