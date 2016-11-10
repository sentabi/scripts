# scripts

Script-script sijenda usur kupake man keperluenku, adina pakendu atendu nen-nen lebe, ula kari silap bene kerina datandu. 

Lisensi script si jenda, si aku erbansa pake Lisensi Cipera
```
Lisensi Cipera
Version 1, Desember 2010

Pakendu atendu ras ubahndu atendu, atendu je. 
```

Cara pake vimna : 
Kloning lebe repository git enda ndai alu
```bash
git clone https://github.com/sentabi/scripts.git
```
dung e pindahken ku inga si pas
```bash
cd scripts/;
cp -r vim ~/.vim;
```
Install ctags 
- Fedora
```bash
su -c "dnf install ctags"
```
- Debian
```bash
su -c "apt-get install ctags"
```


## Multimedia
Motong video ntah pe lagu
```
ffmpeg -strict -2 -ss 00:46:30 -t 00:06:23  -i 'VIDEO.MP4' 'HASIL.MP4'
```
00:46:30 : waktu mulaina
00:06:23 : piga detik/menit makana i potong video/lagu e.


## sed

**Perintah**
```
sed -i '/Link/,+9 d' blabla.txt
```
cat `blabla.txt`
```
cerita cinta ini membuuhku
Link Download :


akdsfaksdfadsfs
http://xxxxx///
http
czxvsadfdas
ftp
```

**Hasil**

cerita cinta ini membuuhku

## Hapus Pro Player [WordPress]
$ cat ikoer
```
kambing guling
kenapa ya bang
ngga tau dek
[pro-player type="MP3"]http://domain/bla%20bla%20bla/a%20Lee%20yo%20-%20help.mp3[/pro-player]
[download id="79"]
```

$ sed 's/^\[.*\]//' ikoer
```
kambing guling
kenapa ya bang
ngga tau dek
```


## Autorestart Shoutcast
```
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

```







-
*makaro*
