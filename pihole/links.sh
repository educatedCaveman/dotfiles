#!/bin/bash
#links for files
BACKUP="${HOME}"/backup-links
PIHOLE="/etc/pihole"
#WEB="/var/www/html/admin/style/vendor"
DOTFILES="${HOME}/dotfiles/pihole"

#first copy the default files that we'll be linking:
mkdir "${BACKUP}" 
cp "${HOME}"/.bash_aliases "${BACKUP}"/bash_aliases
cp "${HOME}"/.bashrc "${BACKUP}"/bashrc
cp "${HOME}"/.vimrc "${BACKUP}"/vimrc
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
rm "${HOME}"/.tmux.conf
rm /etc/hosts
rm "${PIHOLE}"/whitelist.txt
rm "${PIHOLE}"/blacklist.txt
rm "${PIHOLE}"/adlists.list

#now create the links
ln -s "${DOTFILES}"/bash_aliases "${HOME}"/.bash_aliases
ln -s "${DOTFILES}"/bashrc "${HOME}"/.bashrc
ln -s "${HOME}"/dotfiles/vimrc "${HOME}"/.vimrc
ln -s "${DOTFILES}"/tmux.conf "${HOME}"/.tmux.conf
ln -s "${DOTFILES}"/hosts.file /etc/hosts
ln -s "${DOTFILES}"/whitelist.txt "${PIHOLE}"/whitelist.txt
ln -s "${DOTFILES}"/blacklist.txt "${PIHOLE}"/blacklist.txt
ln -s "${DOTFILES}"/adlists.list "${PIHOLE}"/adlists.list

echo "now look here:  https://github.com/jacobbates/pi-hole-midnight"
