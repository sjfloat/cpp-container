
from sjfloat/dev:stretch

maintainer steve@jonescape.com

env DEBIAN_FRONTEND noninteractive

user root

run apt-get update && apt-get install -y \
    rlwrap \
    vim-nox \
    unzip \
    gcc \
    cmake \
    libboost-all-dev

run apt-get clean
run rm -rf /var/lib/apt/lists/*

env HOME /home/$USER

workdir $HOME

user root
run rm -rf /tmp/* /var/tmp/*

user $USER

cmd $SHELL -l
