#!/bin/bash

# impor database dari remote server. 
# script yang dijalankan di remote server mysql-dump.sh

set -e
FOLDERBACKUP=/tmp

if [[ ! -z "$1" ]] ; then
    ssh root@localhost "/opt/mysql-dump.sh $1"
    FILEBASSERVER=$(ssh root@localhost "ls -Art ~/$1-*.sql | tail -n 1")
    FILESQL=$(basename $FILEBASSERVER)
    scp jering:$FILEBASSERVER $FOLDERBACKUP

    if [[ -n "$FILESQL" ]]; then
        mysqladmin drop "$1" -f
        mysqladmin create "$1"
        mysql "$1" < $FOLDERBACKUP/$FILESQL
        /usr/bin/notify-send "Enggo dung ngimpor database $1 !"
        echo "Enggo dung ngimpor database $1 !"
    else
        echo "Lalit database $1 bas server"
    fi
else
    echo "Lenga kap tamandu database si i backup!"
    echo "contoh " $0 "gelardatabase"
fi
