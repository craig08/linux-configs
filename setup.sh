#!/bin/bash
apt-get install -y git
GIT_SSL_NO_VERIFY=true git clone https://git@batarang.myds.me:52316/craigchi/linux-configs.git
cd linux-configs
./env.sh deploy
