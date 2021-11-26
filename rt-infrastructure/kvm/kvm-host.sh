#!/bin/bash

set -e

vagrant_cwd=${pwd}

dnf -y update

# Install vagrant
dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
dnf install -y vagrant

# Install libvirt packages
dnf install -y gcc libvirt libvirt-devel libxml2-devel make ruby-devel libguestfs-tools qemu-kvm
systemctl start libvirtd
systemctl enable libvirtd

# Build libssh
mkdir /tmp/libssh
dnf download --source libssh --destdir /tmp/libssh
rpm2cpio /tmp/libssh/libssh-*.src.rpm | cpio -imdV -D /tmp/libssh
tar xf /tmp/libssh/libssh-*.tar.xz -C /tmp/libssh
mkdir /tmp/libssh/build && cd /tmp/libssh/build
cmake ../libssh-* -DOPENSSL_ROOT_DIR=/opt/vagrant/embedded/
make -j$(nproc)
cp lib/libssh* /opt/vagrant/embedded/lib64
rm -rf /tmp/libssh

# Build krb5
mkdir /tmp/krb5
dnf download --source krb5-libs --destdir /tmp/krb5
rpm2cpio /tmp/krb5/krb5-*.src.rpm | cpio -imdV -D /tmp/krb5
tar xf /tmp/krb5/krb5-*.tar.gz -C /tmp/krb5
cd /tmp/krb5/krb5-*/src
./configure
make -j$(nproc)
cp -a lib/crypto/libk5crypto.* /opt/vagrant/embedded/lib64/
rm -rf /tmp/krb5

# Install libvirt provider
cd $vagrant_cwd
export CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib64"
vagrant plugin install vagrant-libvirt

# Start the virtual machine
vagrant up