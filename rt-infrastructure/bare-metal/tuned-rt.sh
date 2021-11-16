# Use the tuned tool for improving general real-time performance
dnf install tuned-profiles-realtime
echo "realtime" > /etc/tuned/active_profile
echo "isolated_cpucores=25-39" >> /etc/tuned/realtime-variables.conf
systemctl enable tuned && systemctl start tuned
systemctl reboot
