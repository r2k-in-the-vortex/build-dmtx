# build-dmtx

to obtain dmtx.dll in windows run build.ps1

commands:


docker build -t ubuntu-build-libdmtx .

$currentpath=$pwd.Path

docker run --rm -t -v $currentpath/:/build ubuntu-build-libdmtx -c 'sudo ./build.sh'