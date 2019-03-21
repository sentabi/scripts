#!/usr/bin/env bash

# Download daftar IP dari tiap akun Linode
# menggunakan linode-cli
# author : Tommy A. Surbakti <tommy@surbakti.com>

# letak path lengkap folder dimana script berada
# source https://stackoverflow.com/a/246128
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# lokasi penyimpanan file server dari Linode
FOLDER="$DIR/server/linode"

# hapus file log lama
rm -f $FOLDER/*

# LINODE CLI belum support multiple account jadi harus diakali
# list linode Personal Access Token https://cloud.linode.com/profile/tokens
declare -A LINODEACCOUNT

LINODEACCOUNT["USERNAME1"]="PERSONAL-ACCESS-TOKEN1"
LINODEACCOUNT["USERNAME2"]="PERSONAL-ACCESS-TOKEN2"

# VALIDASI
if ! type "linode-cli" &> /dev/null; then
    echo "linode-cli tidak ditemukan"
    echo "cek https://github.com/linode/linode-cli"
    exit 1
fi

if [ ! -d $FOLDER ]; then
    mkdir -p $FOLDER
fi
# END VALIDASI

# download data Linode
for i in "${!LINODEACCOUNT[@]}"
do
cat <<EOF > ~/.linode-cli
[DEFAULT]
token = ${LINODEACCOUNT[$i]}
region = us-central
type = g6-nanode-1
image = linode/centos7
EOF


TOTALHALAMAN=$(linode-cli linodes list | grep 'Page [0-9] of [0-9]' | cut -d ' ' -f 4 | sed 's/\.//g')

if [ ! $TOTALHALAMAN -gt 0 ]; then
    echo "Error cek linode-cli."
    exit 1
fi

# nama file yang disimpan
NAMAFILEPENYIMPANAN="$FOLDER/${i}-linode.txt"
# buat terlebih dahulu filenya
touch $NAMAFILEPENYIMPANAN

echo "Download server list dari akun ${i}"

# sesuaikan format yang di download  dibagian --format
# cek manual linode-cli untuk list lengkapnya
for hal in $(seq 1 $TOTALHALAMAN)
do
    linode-cli linodes list --page $hal --no-headers  --text --format 'id,ipv4,region' --delimiter ',' >> $NAMAFILEPENYIMPANAN
done

echo "Download server list dari akun ${i} SELESAI."
echo "--------------------------------------------"

done
# end download data linode

echo "Selesai!"
