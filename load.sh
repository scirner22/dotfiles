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
scp $current_dir/vimrc core:~/.vimrc

printf "\nperform boxcutter specific actions...\n"
ssh core touch brown_m_and_ms
ssh core /opt/code/data-warehouse-service/bin/create_serve_01.bash
ssh core php /opt/code/RJMetrics/Replication/src/replication/TaskRunner.php create-infrastructure 2
