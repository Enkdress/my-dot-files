#!/usr/bin/env bash

# Cuando abro una terminal hacer las siguientes verificaciones:
# 1. Si no hay un servidor de tmux, abrirlo (tmux start-server), y ejecutar ts -a.
# 2. Si hay un servidor activo y estoy dentro de una session de tmux, no hacer nada.
# 3. Si hay un servidor y no estoy en una session, ejecutar ts -a.

has_tmux_server() {
	if [[ -n $(pgrep tmux) ]]; then
		return true
	fi
}

start_tmux() {
	sleep 2
	tmux start-server
	sh $HOME/.dotFiles/tmux-sessionizer.sh -a
}

open_tmux() {
	tmux a
}

under_tmux_session() {
	if [[ "$TERM_PROGRAM" = tmux ]]; then
		return true
	fi
}

 if has_tmux_server; then 
 	echo "Has Server"
	if [ ! $(under_tmux_session) ]; then
		echo "Not under session"
		sh $HOME/.dotFiles/tmux-sessionizer.sh -a
	fi

 fi

 if [ ! $(has_tmux_server)]; then
 	echo "Not server"
	start_tmux
fi


