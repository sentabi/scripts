#!/usr/bin/env bash
# Generate CSR
openssl=`which openssl`
COUNTRY=ID
STATE=JAKARTA
CITY=JAKARTA
COMPANY="KARO"
UNIT=SSL
COMMONNAME="$1"

openssl req -nodes -newkey rsa:4096 -keyout $COMMONNAME.key -out $COMMONNAME.csr -new -sha256 -subj "/C=$COUNTRY/ST=$STATE/L=CITY/O=$COMPANY/OU=$UNIT/CN=$COMMONNAME"
