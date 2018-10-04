From ubuntu:latest

ENV HOME /root
RUN apt-get update
RUN apt-get install -y git
WORKDIR $HOME
RUN git clone https://www.github.com/craig08/linux-configs.git
WORKDIR $HOME/linux-configs
RUN ./apply.sh install
RUN /root/.vim/bundle/neobundle.vim/bin/neoinstall

WORKDIR $HOME
ENTRYPOINT ["/bin/bash"]
