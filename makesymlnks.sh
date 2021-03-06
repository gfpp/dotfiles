#!/bin/bash
#
#------------------------------------------------------------------------------
# This script creates symlinks from the home directory to any desired 
# dotfiles in ~/dotfiles


# from: 
#   http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#   https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

#files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"
files ="vimrc bashrc"             # list of files/foders to symlink in homedir
#------------------------------------------------------------------------------

# Create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Move any existing dotfiles in homedir to dotfiles_old directory, 
# then create symlinks from the homedir to any files in the 
# ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

