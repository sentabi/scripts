#!/bin/bash
cd /home/sentabi/kerangen/;
## ula ikutken folder Gendang Karo
find /home/sentabi/kerangen/ -type f -name "*.mp3" ! -path "/home/sentabi/kerangen/Gendang Karo/*"| sort -n  > /home/sentabi/kerangen/lagu2.pls
## ula ikutken lagu-lagu si lit bas file exclude
grep -v -f /home/sentabi/radio/exclude /home/sentabi/kerangen/lagu2.pls > /home/sentabi/kerangen/lagu.pls
rm -f /home/sentabi/kerangen/lagu2.pls
