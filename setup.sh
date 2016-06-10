#!/bin/bash
sudo apt install -y git
cd $HOME
GIT_SSL_NO_VERIFY=true git clone https://git@batarang.myds.me:52316/craigchi/linux-configs.git
cd linux-configs
./apply.sh install
