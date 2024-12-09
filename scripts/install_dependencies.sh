#!/bin/bash

set -e

dotfiles_dir=~/dotfiles
log_file=$dotfiles_dir/link_install.txt


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> $log_file 2>&1

sudo snap install bash-language-server --classic >> $log_file 2>&1

pip install pre-commit

sudo apt install nodejs
sudo apt install npm

#:CocInstall coc-json
#:CocInstall @yaegassy/coc-ruff
#:CocCommand ruff.builtin.installServer
#:CocCommand clangd.install

echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file
