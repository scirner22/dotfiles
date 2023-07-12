# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'auto'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color yellow
	echo -n $PWD
	set_color green
	printf '%s\n' (__fish_git_prompt)
	set_color brblack
	echo -n "["(date +"%I:%M %p")"] "
	set_color red
	echo -n '$ '
	set_color normal
end
