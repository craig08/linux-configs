#!/bin/bash

Usage() {
    /bin/cat << EOF
Usage:
    $(dirname $0)/$(basename $0) deploy: setup environment (bash, vim, git, tmux)
    $(dirname $0)/$(basename $0) restore: restore configurations
    $(dirname $0)/$(basename $0) update: update configurations to this repository
EOF
}

Restore() {
    for i in bashrc vimrc tmux.conf gitconfig; do
        [ -f ~/.$i ] && [ ! -f ~/.${i}.bak ] && mv -f ~/.$i ~/.${i}.bak && echo "backup original .$i to .${i}.bak"
        cp -af $(dirname $0)/$i ~/.$i && echo "copy file $(dirname $0)/$i to ~/.$i"

    done
}

Update() {
    for i in bashrc vimrc tmux.conf gitconfig; do
        cp -af ~/.$i $(dirname $0)/$i && echo "copy file ~/.$i to $(dirname $0)/$i"
    done
}

if [ "$1" = "deploy" ]; then
    apt-get install -y ssh vim curl ctags make tmux sed
    sed -i 's/PermitRootLogin.*$/PermitRootLogin yes/' /etc/ssh/sshd_config
    /etc/init.d/ssh start
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
    Restore
    locale-gen zh_TW.UTF-8 en_US.UTF-8
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo "Change timezone to Taipei"
    echo "Set your root password with passwd!"
elif [ "$1" = "restore" ]; then
    Restore
elif [ "$1" = "update" ]; then
    Update
else
    Usage
    exit 1
fi
