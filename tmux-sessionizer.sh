#!/usr/bin/env bash

usage() {
 echo "Usage: $0 [OPTIONS]"
 echo "Options:"
 echo " -h, --help              Display this help message"
 echo " -o, --opened-sessions   Show only the opened sessions"
 echo " -a, --all-projects      Show all the projects available"
}
selected=""
handle_options() {
  while [ $# -gt 0 ]; do
    case $1 in
      -h | --help)
        usage
        exit 0
        ;;
      -o | --opened-session)
        selected=$(tmux list-sessions -F\#S | fzf)
        shift
        ;;
      -a | --all-projects)
        selected=$(find ~/.dotFiles ~/.dotFiles/config ~/dev ~/Documents/Personal -mindepth 1 -maxdepth 1 -type d | fzf)
        shift
        ;;
      *)
        echo "Invalid option: $1" >&2
        usage
        exit 1
        ;;
    esac
    shift
  done
}

handle_options "$@"

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
# echo $selected_name - Only name "stadium"
# echo $selected - The whole path "Users/../nu/stadium"

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
		tmux send-keys -t $selected_name "v ." Enter
fi

if [[ -z $TMUX ]]; then
    tmux attach-session -t $selected_name
else
    tmux switch-client -t $selected_name
fi
