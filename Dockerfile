
from sjfloat/dev

maintainer steve@jonescape.com

env DEBIAN_FRONTEND noninteractive

user root

#run apt-get update && apt-get install -y \
#    software-properties-common

## for boost
#run add-apt-repository -y ppa:samuel-bachmann/boost
##run apt-get -qq -d update

run apt-get update && apt-get install -y \
    rlwrap \
    vim-nox \
    unzip \
    gcc \
    cmake \
    libboost-all-dev

#    boost1.60


run apt-get clean
run rm -rf /var/lib/apt/lists/*

env HOME /home/$USER

workdir $HOME

user root
run rm -rf /tmp/* /var/tmp/*

user $USER

cmd $SHELL -l
