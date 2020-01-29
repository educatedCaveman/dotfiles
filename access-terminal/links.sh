#!/bin/bash

ln -s $HOME/dotfiles/access-terminal/terminator.config $HOME/.config/terminator/config
ln -s $HOME/dotfiles/access-terminal/bash_aliases $HOME/.bash_aliases
ln -s $HOME/dotfiles/access-terminal/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/init.vim $HOME/.nvimrc
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/access-terminal/i3config $HOME/.config/i3/config
ln -s $HOME/dotfiles/access-terminal/py3status.conf $HOME/.py3status.conf
ln -s $HOME/dotfiles/redshift.conf $HOME/.config/redshift.conf
#for firefox wayland
ln -s $HOME/dotfile/envvars.conf $HOME/.config/environment.d/envvars.conf
