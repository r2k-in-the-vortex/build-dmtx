FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils build-essential sudo git autoconf automake libtool pkg-config ca-certificates libmagickwand-dev
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN export LD_LIBRARY_PATH=/usr/local/lib
USER docker