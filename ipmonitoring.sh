#!/usr/bin/env bash

# Script untuk memonitoring Public IP
# author : Tommy A. Surbakti <tommy@surbakti.com>
# jalankan dengan crontab
# contoh tiap 15 menit : */15 * * * * /opt/ipmonitoring.sh

FOLDERIP=$HOME/IP
IPLOG=$FOLDERIP/logip
IPLAMA=$FOLDERIP/iplama
TANGGAL=$(date '+%d-%m-%Y %T')

if [[ ! -d $FOLDERIP ]]; then
    mkdir "$FOLDERIP"
fi
if [[ ! -f "$IPLAMA" ]]; then
    touch "$IPLAMA"
fi

if [[ ! -f "$IPLOG" ]]; then
    touch "$IPLOG"
fi

PUBLIC_IP_SEKARANG=$(curl -s https://canihazip.cos/s)

if [ -z $PUBLIC_IP_SEKARANG ]; then
    PUBLIC_IP_SEKARANG=$(curl -s ifconfig.me/ip)
fi

if [ -z $PUBLIC_IP_SEKARANG ]; then
    PUBLIC_IP_SEKARANG=$(curl -s checkip.dyndns.com | cut -d' ' -f 6  | cut -d'<' -f 1)
fi

if [ -z $PUBLIC_IP_SEKARANG ]; then
    exit 1
fi

GETIPLAMA=$(cat "$IPLAMA")

if [ "$PUBLIC_IP_SEKARANG" != "$GETIPLAMA" ]; then
    echo "$PUBLIC_IP_SEKARANG" > "$IPLAMA"
    echo "$TANGGAL" "IPLAMA:$GETIPLAMA" "IPBARU:$PUBLIC_IP_SEKARANG" >> "$IPLOG"
	export DISPLAY=:0
	/usr/bin/notify-send 'IP BERUBAH !!' "$PUBLIC_IP_SEKARANG"
fi
