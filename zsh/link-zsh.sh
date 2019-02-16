#!/bin/bash
#ironic, I know...
#script to automate the setup of zsh on other machines
BACKUP="$HOME/oh-my-zsh-install-backup-$(date +%F-%T)"
DOTFILES="$HOME/dotfiles/zsh"
HOMEDOT="$HOME/."

#check for zsh installed. if not, report and exit
echo "checking for ZSH installation..."
which zsh > /dev/null 2>&1
#which ass > /dev/null 2>&1
rc=$?
if [[ $rc -eq 1 ]]
then
    echo "ZSH not installed, or some other error.  exiting."
    exit 1
else
    echo "ZSH installation detected."
fi

echo "" #formatting

#if oh-my-zsh isn't already installed, go get it, and install it
echo "checing for pre-existing oh-my-zsh installation..."
if [ -e ~/.oh-my-zsh ]
then
    echo "oh-my-zsh already installed."
else
    echo "oh-my-zsh not installed."
    echo "attempting to install oh-my-zsh:"
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    rc=$?
    #detect errors, exiting if detected
    if [[ $rc -ne 0 ]]
    then
        echo "oh-my-zsh installation failed. manual investigation required."
        exit 1
    else
        echo "oh-my-zsh installation completed with no detected error."
    fi
fi

echo "" #formatting

#prepare to link files:
echo "creating backup folder..."
mkdir "${BACKUP}"
echo "" #formatting

#take care of any existing files:
echo "backing up files, if applicable:"
for FILE in ~/.zshrc ~/.zsh_aliases ~/.oh-my-zsh/custom/themes/less-fishy.zsh-theme
do
    #does the file already exist?
    if [ -e "${FILE}" ]
    then
        printf "\t${FILE} exists.\n"
        #is the file a link?
        if [[ -L "${FILE}" ]]
        then
            printf "\t${FILE} is a link.  no need to back up.  removing...\n"
            #if the file exists, and is a link, remove it
            rm "${FILE}"
        else
            printf "\tbacking up ${FILE}.\n"
            #if the file exists, but is a regular file, move it to backup
            mv "${FILE}" "${BACKUP}"
        fi
        echo "" #formatting
    fi
done

echo "all files backed up."
echo "creating links..."

#link the files:
ln -s "${DOTFILES}/zshrc" "${HOME}/.zshrc"
ln -s "${DOTFILES}/zsh_aliases" "${HOME}/.zsh_aliases"
ln -s "${DOTFILES}/less-fishy.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/less-fishy.zsh-theme"

echo "" #formatting

#cleanup:
num=$(ls -1 "${BACKUP}" | wc -l)
if [[ $num -eq 0 ]]
then
    echo "backup folder empty.  deleting."
    rm -r "${BACKUP}"
else
    echo "check backup directory (${BACKUP}) for files that were backed up."
fi

echo "" #formatting
echo "done."

