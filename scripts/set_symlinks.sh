#!/bin/bash
set -e

dotfiles_dir=~/dotfiles
log_file=$dotfiles_dir/link_log.txt

# simple dotfiles
files_to_link=("vimrc" "gnuplot" "zshrc" "tmux.conf" "gitconfig" "bazelrc")
for file in ${files_to_link[@]}; do
    sudo rm -rf ~/.$file >> $log_file 2>&1
    ln -sf $dotfiles_dir/$file ~/.$file
done

#coc settings 
file_to_link="coc-settings.json"
sudo rm -rf ~/.vim/$file_to_link >> $log_file 2>&1
ln -sf $dotfiles_dir/$file ~/.vim/$file_to_link

echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file
