#!/bin/bash

set -e

dotfiles_dir=~/dotfiles
log_file=$dotfiles_dir/link_install.txt

sudo apt install git
sudo apt install vim
sudo apt-get install tmux
sudo apt install fzf
sudo apt install curl
sudo apt install zsh
chsh -s $(which zsh)
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> $log_file 2>&1

sudo snap install bash-language-server --classic >> $log_file 2>&1

#pip install pre-commit

sudo apt install pip
sudo apt install pipx
pipx ensurepath
pipx install poetry
poetry config virtualenvs.in-project true
sudo apt install nodejs
sudo apt install npm

#:CocInstall coc-json
#:CocInstall @yaegassy/coc-ruff
#:CocInstall coc-pyright
#:CocInstall coc-clangd
#:CocCommand ruff.builtin.installServer
#:CocCommand clangd.install

# Gogh for terminakl colors
#bash -c "$(wget -qO- https://git.io/vQgMr)"

echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file
