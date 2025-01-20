#!/bin/bash

# Check if tmux is running
if ! pgrep -x "tmux" > /dev/null; then
	# Function to create a tmux session with 3 windows and dynamic number of panes
	create_tmux_session() {
		session_name=$1
		window1_name=$2
		# window2_name=$3
		# window3_name=$4
		panes=$5

		# Start a new session with the first window
		tmux new-session -d -s "$session_name" -n "$window1_name"
		create_panes "$session_name" "$window1_name" "$panes"
	}

	# Function to create the panes for a window
	create_panes() {
		session_name=$1
		window_name=$2
		panes=$3

		# Split the window into the number of panes
		for (( i=1; i<panes; i++ )); do
			tmux split-window -h -t "$session_name:$window_name.$((i-1))"
			tmux select-layout -t "$session_name:$window_name" tiled
		done
	}

	# Setup windows and panes
	create_tmux_session "work" 1
	create_tmux_session "reading" 1
	create_tmux_session "uni" 1
	create_tmux_session "htop" 1
fi
