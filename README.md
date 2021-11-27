# meng-thesis-work

```
git clone --recursive https://github.com/jpnorenam/meng-thesis-work.git
```

### Install DPsim dependencies
```
sudo sh dpsim/Packaging/Shell/install-fedora-deps.sh
```
### Build DPsim
```
mkdir dpsim/build && cd dpsim/build

cmake \
    -DCIM_VERSION=CGMES_2.4.15_16FEB2016 \
    -DWITH_PYTHON=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DDPSIM_BUILD_EXAMPLES=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=/usr/local/lib64 \
    .. && make -j$(nproc)
```