#!/usr/bin/env bash
# export database
# contoh ./mysql-dump.sh email

_DATE=$(date +%d%m%Y-%H%M%S)

if [ ! -z "$1" ] ; then
    mysqldump $1 > ~/$1-$_DATE.sql
else
    echo "Lenga kap tamandu database si i backup!"
    echo "contoh " $0 "database"
fi
