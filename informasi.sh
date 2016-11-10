#!/bin/bash
# (c) 2013 Kacibang Kerangen
# Dibawah lisensi : Kera Tonggal
#$resolusi = "xdpyinfo  | grep 'dimensions:' | tr -s ' '|cut -c14-21"
#$distro = "cat /etc/redhat-release"
#$hostname = "$HOSTNAME"
#$de = "$DESKTOP_SESSION"

## cetak data dilayar
#echo "Tanggal           : " $(cal)
echo "Resolusi Monitor  : " $(xdpyinfo  | grep 'dimensions:' | tr -s ' '|cut -c14-21)
echo "Distro            : " $(cat /etc/redhat-release)
echo "Hostname          : " $(hostname)
echo "DE                : " $DESKTOP_SESSION
echo "Direktori Home    : " $HOME
echo "User ID           : " $USER
echo "GROUP             : " $(id -Gn)
echo "Total Memory      : " $(sed -n -e '/^MemTotal/s/^[^0-9]*//p' /proc/meminfo)
echo "Hardisk           : " $(df | grep '^/dev/[hs]d' | awk '{s+=$2} END {print s/976562.5}') "GB"
