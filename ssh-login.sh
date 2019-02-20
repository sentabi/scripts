#!/usr/bin/env bash
# Login SSH dengan password default
# Cara penggunaan ./ssh-login IPSERVER

_SSHPASSWORD='INITEMPATPASSWORDNYA'
_SSHHOSTNAME="$1"

sshpass -p ${_SSHPASSWORD} ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@${_SSHHOSTNAME}
