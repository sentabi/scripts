# sync history kerina perintah si i ketik bas terminal
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

PS1="\[\e[1;30m\][\[\e[1;31m\]\u@\H\[\e[1;30m\]\[\e[0;32m\]\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n\$ "
alias passna='pwgen -s -B -y -a 20 1'
alias passna2='pwgen -s -B -n -c -a 20 1'
alias bersihlaravel='php artisan route:clear;php artisan view:clear;php artisan config:clear;php artisan cache:clear;'
alias vnc='vncviewer 192.168.2.3:1'
alias ww='cd /var/www/html'
alias wget='wget --content-disposition'
alias gitdiff='git diff --name-only'
alias wget0='wget -O /dev/null'
