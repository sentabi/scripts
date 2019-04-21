#!/usr/bin/env bash

# Script auto update WordPress, thema ras plugin na.
# script ini mengecek tiap folder yang ada di direktori website
# bila ditemukan wordpress akan otomatis di update/upgrade

WPCLI='/usr/local/bin/wp'
# letak root direktori website
FOLDERWWW='/var/www/'

if [ ! -f $WPCLI ]; then
    echo "---------------------------"
    echo "Download & Install WPCLI ... "
    wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
    chmod +x /usr/local/bin/wp
    echo "Install WPCLI selesai!"
    echo "---------------------------"
fi

cd $FOLDERWWW

for a in `ls -d */`
    do
        cd "$a"
        if [[ -d "wp-admin" ]]; then
            wp core update;
            wp plugin update --all;
            wp theme update --all
        fi
        cd - &>/dev/null
done
