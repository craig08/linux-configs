#!/bin/bash

set -e

Usage() {
    /bin/cat << EOF
Usage:
    $(dirname $0)/$(basename $0) install: setup environment and link configurations
    $(dirname $0)/$(basename $0) link: link configurations (bash, vim, git, tmux)
    $(dirname $0)/$(basename $0) unlink: remove link and restore configurations
EOF
}

Link() {
    for i in .bashrc .vimrc .tmux.conf .gitconfig .profile; do
        [ -f ~/$i ] && [ ! -f ~/${i}.bak ] && mv -f ~/$i ~/${i}.bak && echo "backup original $i to ${i}.bak"
        ln -s $(cd $(dirname $0); pwd)/env/$i ~/$i && echo "link file $(cd $(dirname $0); pwd)/env/$i to ~/$i"
    done
}

Unlink() {
    for i in .bashrc .vimrc .tmux.conf .gitconfig .profile; do
        rm -f ~/$i && mv -f ~/${i}.bak ~/$i && echo "unlink file ~/$i and restore default"
    done
}

InstallYay() {
    sudo pacman -Sy binutils base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd -
    rm -rf yay/
}

if [ "$1" = "install" ]; then
    yay || InstallYay
    yay -Sy vim curl ctags cscope make tmux sed the_silver_searcher bash-completion python3
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    Link
    vim +PlugInstall +qall
    echo "Set your root password with passwd!"
elif [ "$1" = "link" ]; then
    Link
elif [ "$1" = "unlink" ]; then
    Unlink
else
    Usage
    exit 1
fi
