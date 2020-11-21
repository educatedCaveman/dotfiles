#!/bin/bash
#links for files
BACKUP="${HOME}"/backup-links
PIHOLE="/etc/pihole"
#WEB="/var/www/html/admin/style/vendor"
DOTFILES="${HOME}/dotfiles/pihole"

#TODO: link regex, FTL

#first copy the default files that we'll be linking:
mkdir "${BACKUP}" 
cp "${HOME}"/.bash_aliases "${BACKUP}"/bash_aliases
cp "${HOME}"/.bashrc "${BACKUP}"/bashrc
cp "${HOME}"/.vimrc "${BACKUP}"/vimrc
cp "${HOME}"/.config/init.vim "${BACKUP}"/init.vim
cp "${HOME}"/.tmux.conf "${BACKUP}"/tmux.conf
cp /etc/hosts "${BACKUP}"/hosts
cp "${PIHOLE}"/whitelist.txt "${BACKUP}"/whitlist.txt
cp "${PIHOLE}"/blacklist.txt "${BACKUP}"/blacklist.txt
cp "${PIHOLE}"/adlists.list "${BACKUP}"/adlists.list

#remove the files:
#TODO:  check if they exist. if they do, don't remove them. report it and exit
rm "${HOME}"/.bash_aliases
rm "${HOME}"/.bashrc
rm "${HOME}"/.vimrc
rm "${HOME}"/.config/nvim/init.vim
rm "${HOME}"/.tmux.conf
sudo rm /etc/hosts
sudo rm "${PIHOLE}"/whitelist.txt
sudo rm "${PIHOLE}"/blacklist.txt
sudo rm "${PIHOLE}"/adlists.list

#now create the links
sudo ln -s "${DOTFILES}"/bash_aliases "${HOME}"/.bash_aliases
sudo ln -s "${DOTFILES}"/bashrc "${HOME}"/.bashrc
sudo ln -s "${HOME}"/dotfiles/vimrc "${HOME}"/.vimrc
sudo ln -s "${HOME}"/dotfiles/init.vim "${HOME}"/.config/nvim/init.vim
sudo ln -s "${DOTFILES}"/tmux.conf "${HOME}"/.tmux.conf
#TODO: add logic to pick the correct host file.  maybe be interactive?
sudo ln -s "${DOTFILES}"/hosts.file /etc/hosts
sudo ln -s "${DOTFILES}"/whitelist.txt "${PIHOLE}"/whitelist.txt
sudo ln -s "${DOTFILES}"/blacklist.txt "${PIHOLE}"/blacklist.txt
sudo ln -s "${DOTFILES}"/adlists.list "${PIHOLE}"/adlists.list

#TODO: run zsh config, too

echo "now look here:  https://github.com/jacobbates/pi-hole-midnight"
