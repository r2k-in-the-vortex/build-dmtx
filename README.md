# build-dmtx

build setup for libdmtx in docker

commands:

docker build -t ubuntu-build-libdmtx .

docker run --rm -t -v $pwd.Path:/build ubuntu-build-libdmtx -c './build/build.sh'