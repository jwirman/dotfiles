#!/bin/bash
############################
# .makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/src/dotfiles
############################

########## Variables

dir=~/src/dotfiles                # dotfiles directory
olddir=~/src/dotfiles_old         # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="vim vimrc gvimrc bashrc bash_vcs.sh ackrc irbrc screenrc editrc zshrc oh-my-zsh gemrc bash_profile gitignore gitconfig"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
