From ubuntu:latest

RUN apt-get update
RUN apt-get install -y git
RUN cd /root/ && git clone https://www.github.com/craig08/linux-configs.git
RUN cd /root/linux-configs && ./apply.sh install
RUN /root/.vim/bundle/neobundle.vim/bin/neoinstall
