#!/bin/bash
# gabungkan perintah ini dengan crontab biar dieksekusi tiap x menit
# perintah untuk menjalankan sc_trans shoutcast
RESTART="./sc_trans_linux"
# letak pgrep di Linux anda 
PGREP="/usr/bin/pgrep"
SCTRANS="sc_trans_linux"
$PGREP ${SCTRANS} 
if [ $? -ne 0 ] # bila sc_trans_linux tidak ditemukan atau tidak jalan
then
 # restart sc_trans_linux
cd /home/karo/radio
 $RESTART
 fi

