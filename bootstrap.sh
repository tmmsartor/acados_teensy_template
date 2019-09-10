#! /bin/bash

pushd libraries
git clone https://github.com/tmmsartor/acados.git

pushd acados
git submodule update --init external/hpipm
git submodule update --init external/blasfeo
git submodule update --init external/qpoases

git checkout teensy_platform
echo "TEMPLATES_PATH = $(pwd)/../../" > Makefile.local
make -j4
popd

ln -s acados/external/hpipm .
ln -s acados/external/blasfeo .
popd

make -j4
