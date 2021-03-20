# Moria's tmux config

# set shell
set-option -g default-shell /bin/zsh

# TODO: customize bottom

# navigation:
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

bind-key -n C-Tab next-window
bind-key -n C-S-Tab previous-window

#scrolling
set -g mouse on

# t-rex script

# watch nvidia stats

# run these on boot?
