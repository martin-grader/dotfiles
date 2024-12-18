#!/bin/bash

set -e

dotfiles_dir=~/dotfiles
log_file=$dotfiles_dir/link_install.txt

echo "installing vim"
sudo apt install vim >> $log_file 2>&1
echo "installing tmux"
sudo apt-get install tmux >> $log_file 2>&1
echo "installing fzf"
sudo apt install fzf >> $log_file 2>&1
echo "installing curl"
sudo apt install curl >> $log_file 2>&1
echo "installing zsh"
sudo apt install zsh >> $log_file 2>&1

#echo "making zsh default (remember to restart)"
#chsh -s $(which zsh) >> $log_file 2>&1

# echo "installing oh-my-zsh"
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# Gogh for terminakl colors
#bash -c "$(wget -qO- https://git.io/vQgMr)"


echo "installing vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> $log_file 2>&1

echo "installing bash language server"
sudo snap install bash-language-server --classic >> $log_file 2>&1

echo "installing pip"
sudo apt install pip >> $log_file 2>&1
echo "installing pipx"
sudo apt install pipx >> $log_file 2>&1
pipx ensurepath >> $log_file 2>&1
echo "installing poetry"
pipx install poetry >> $log_file 2>&1
poetry config virtualenvs.in-project true >> $log_file 2>&1
echo "installing nodejs"
sudo apt install nodejs >> $log_file 2>&1
echo "installing npm"
sudo apt install npm >> $log_file 2>&1

#:CocInstall coc-json
#:CocInstall @yaegassy/coc-ruff
#:CocInstall coc-pyright
#:CocInstall coc-clangd
#:CocCommand ruff.builtin.installServer
#:CocCommand clangd.install

echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file
