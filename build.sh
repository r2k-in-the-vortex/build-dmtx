cd /build

rm -rf libdmtx
rm -rf dmtx-utils

git clone https://github.com/dmtx/libdmtx.git
git clone https://github.com/dmtx/dmtx-utils.git

cd /build/libdmtx

./autogen.sh
./configure
make
sudo make install

cd /build/libdmtx/.libs
gcc -shared -o dmtx.dll libdmtx_la-dmtx.o -Wl,--out-implib,libdmtx.a


cd /build/dmtx-utils
./autogen.sh
./configure
make
sudo make install

LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

cd /build
rm -rf image.png

echo -n 123456 | dmtxwrite > image.png
dmtxread -n image.png

