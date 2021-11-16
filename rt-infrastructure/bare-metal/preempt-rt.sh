# Install Planet CCRMA's precompiled PREEMPT_RT patched Linux kernel
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-core-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-devel-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-modules-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-modules-extra-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
systemctl reboot
