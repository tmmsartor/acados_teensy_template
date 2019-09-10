#! /bin/bash

pushd libraries
git clone   https://github.com/tmmsartor/acados.git

pushd acados
git submodule update --recursive --init
git checkout teensy_platform
echo "$(pwd)/../../" > Makefile.local
make -j4
popd

ln -s acados/hpipm .
ln -s acados/blasfeo .
popd

make -j4
