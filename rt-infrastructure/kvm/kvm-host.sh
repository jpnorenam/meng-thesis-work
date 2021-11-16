dnf -y update

# Install virtualization packages
dnf -y install bridge-utils libvirt virt-install qemu-kvm

# Install vagrant and plugin for libvirt provider
dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
dnf -y install vagrant
vagrant plugin install vagrant-libvirt

# Start the virtual machine
vagrant up