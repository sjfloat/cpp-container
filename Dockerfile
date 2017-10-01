from sjfloat/dev:stretch

maintainer steve@jonescape.com

env DEBIAN_FRONTEND noninteractive

user root

copy apt/sources.list.d/jessie.list /etc/apt/sources.list.d/jessie.list
copy apt/preferences.d/pinning /etc/apt/preferences.d/pinning

run apt-get update && apt-get install -y \
    g++-4.9 \
    rlwrap \
    vim-nox \
    unzip \
    cmake \
    libboost-all-dev

run apt-get clean
run rm -rf /var/lib/apt/lists/*

run sudo update-alternatives \
    --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-4.9 \
    --slave /usr/bin/c++ c++ /usr/bin/g++-4.9

env HOME /home/$USER

workdir $HOME

user root
run rm -rf /tmp/* /var/tmp/*

user $USER

cmd $SHELL -l
