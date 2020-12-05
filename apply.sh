#!/bin/bash

Usage() {
    /bin/cat << EOF
Usage:
    $(dirname $0)/$(basename $0) install: setup environment and link configurations
    $(dirname $0)/$(basename $0) link: link configurations (bash, vim, git, tmux)
    $(dirname $0)/$(basename $0) unlink: remove link and restore configurations
EOF
}

Link() {
    for i in .bashrc .vimrc .tmux.conf .gitconfig; do
        [ -f ~/$i ] && [ ! -f ~/${i}.bak ] && mv -f ~/$i ~/${i}.bak && echo "backup original $i to ${i}.bak"
        ln -s $(cd $(dirname $0); pwd)/env/$i ~/$i && echo "link file $(cd $(dirname $0); pwd)/env/$i to ~/$i"
    done
}

Unlink() {
    for i in .bashrc .vimrc .tmux.conf .gitconfig; do
        rm -f ~/$i && mv -f ~/${i}.bak ~/$i && echo "unlink file ~/$i and restore default"
    done
}

InstallGo() {
    [ -z "${1}" ] && echo "No Go version provided!" && return 1
    wget https://dl.google.com/go/go${1}.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go${1}.linux-amd64.tar.gz
    rm -f go${1}.linux-amd64.tar.gz
}

if [ "$1" = "install" ]; then
    apt update || sudo apt update
    apt install -y sudo
    sudo apt install -y ssh vim curl ctags cscope make tmux sed silversearcher-ag locales \
        bash-completion python python3 iputils-ping tig wget
    #InstallGo 1.14.6
    Link
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
    # Configure timezone and locale
    #sudo DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
    #locale-gen zh_TW.UTF-8 en_US.UTF-8
    #cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo "Default timezone to Taipei"
    #dpkg-reconfigure --frontend noninteractive tzdata
    #echo "Set your root password with passwd and change your timezone!"
elif [ "$1" = "link" ]; then
    Link
elif [ "$1" = "unlink" ]; then
    Unlink
else
    Usage
    exit 1
fi
