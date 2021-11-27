#!/bin/bash

set -e

# Install Planet CCRMA's precompiled PREEMPT_RT patched Linux kernel
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-core-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-devel-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-modules-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm
rpm -i http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetcore/30/x86_64/kernel-rt-modules-extra-5.4.24-100.rt15.1.fc30.ccrma.x86_64.rpm

# Install tuned profiles
dnf install tuned-profiles-realtime

# Set real-time profile
echo "realtime" > /etc/tuned/active_profile

# Isolate cores for real-time tasks
echo "isolated_cpucores=$1-$2" >> /etc/tuned/realtime-variables.conf

# Enable tuned service
systemctl enable tuned && systemctl start tuned

# Reboot
systemctl reboot
