source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $DOTFILES/tmux/setup_after_boot.sh