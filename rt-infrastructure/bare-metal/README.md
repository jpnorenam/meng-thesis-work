# Bare-Metal Machine

## Setup Fedora for real-time
```
sudo sh rt-infrastructure/bare-metal/install-fedora-rt.sh 25 39
```

## Install DPsim dependencies
```
sudo sh dpsim/Packaging/Shell/install-fedora-deps.sh
```

## Build DPsim
```
mkdir dpsim/build && cd dpsim/build

cmake \
    -DCIM_VERSION=CGMES_2.4.15_16FEB2016 \
    -DWITH_PYTHON=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DDPSIM_BUILD_EXAMPLES=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=/usr/local/lib64 \
    .. && make -j$(nproc) && cd ../..
```

## Run Real-Time test
```
sh rt-infrastructure/bare-metal/dpsim-rt-test.sh 8 31 39
```