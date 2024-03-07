FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils build-essential sudo git autoconf automake libtool pkg-config ca-certificates libmagickwand-dev
#RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN export LD_LIBRARY_PATH=/usr/local/lib
# Create new user `docker` and disable 
# password and gecos for later
# --gecos explained well here:
# https://askubuntu.com/a/1195288/635348
RUN adduser --disabled-password \
--gecos '' docker

#  Add new user docker to sudo group
RUN adduser docker sudo

# Ensure sudo group users are not 
# asked for a password when using 
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

# now we can set USER to the 
# user we just created
USER docker
WORKDIR /build
ENTRYPOINT ["bash"]