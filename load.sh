#!/bin/bash

current_dir=$(pwd)

printf "linking bash env config..."
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

printf "\ncopying vim config..."
[ -d ~/.vim/autoload ] || mkdir -p ~/.vim/autoload
[ -d ~/.vim/bundle ] || mkdir -p ~/.vim/bundle
[ -f ~/.vim/autoload/pathogen.vim ] || curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## TODO pass params in that control installed folders below

# general plugins
for general in vim/plugins/general/*/
do
  temp=${general%*/}
  plugin=${temp##*/}
  [ -h ~/.vim/bundle/$plugin ] || ln -s $current_dir/vim/plugins/general/$plugin ~/.vim/bundle/$plugin
done

# scala plugins
for scala in vim/plugins/scala/*/
do
  temp=${scala%*/}
  plugin=${temp##*/}
  [ -h ~/.vim/bundle/$plugin ] || ln -s $current_dir/vim/plugins/scala/$plugin ~/.vim/bundle/$plugin
done

# nginx plugins
for nginx in vim/plugins/nginx/*/
do
  temp=${nginx%*/}
  plugin=${temp##*/}
  [ -h ~/.vim/bundle/$plugin ] || ln -s $current_dir/vim/plugins/nginx/$plugin ~/.vim/bundle/$plugin
done

# clojure plugins
for clojure in vim/plugins/clojure/*/
do
  temp=${clojure%*/}
  plugin=${temp##*/}
  [ -h ~/.vim/bundle/$plugin ] || ln -s $current_dir/vim/plugins/clojure/$plugin ~/.vim/bundle/$plugin
done

# clojure plugins
# #ssh core 'cd ~/.vim/bundle && git clone git://github.com/tpope/vim-classpath.git'

printf "\nsetup complete!\n"
