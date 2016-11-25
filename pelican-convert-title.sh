#!/bin/sh
# Pelican Header generator
# Sesuaiken ras blogndu pal 
# adina lit sisalah ula sungkun aku, sungkun Dibata, curhatken man Dibata kerina kiniseran kegeluhenndu
# linsesi bas Dibata sebab ia simbereken pemeteh
# Cara makesa 
# ./gen.sh "Judul Tulisenndu Uga Deba Ban Gedangna Yah"


Tanggal=$(date +"%Y-%m-%d %H:%M")
echo "$1" > judul
tr '[A-Z]' '[a-z]' < judul > judulx
sed -i 's/ /-/g' judulx
JUDUL=$(cat judulx)
echo "Title: $1
Date: $Tanggal
Author: Surbakti
Category: News
Tags: $2
Slug: $JUDUL
" > content/$JUDUL.md
xdg-open content/$JUDUL.md
