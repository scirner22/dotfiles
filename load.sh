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
scp $current_dir/bash_ps1 core:~/.bash_ps1
scp $current_dir/tmux.conf core:~/.tmux.conf

printf "\nperform boxcutter specific actions...\n"
ssh core touch brown_m_and_ms
ssh core /opt/code/data-warehouse-service/bin/create_serve_01.bash
ssh core /opt/code/RJMetrics/Replication/src/replication/TaskRunner.php create-infrastructure 2
