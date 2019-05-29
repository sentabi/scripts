#!/usr/bin/env bash
# Download Youtube dan konversi ke MP3

# lokasi/path ffmpeg dan youtube-dl. bisa diganti dengan $(which ffmpeg)
ffmpeg="/usr/bin/ffmpeg"
youtube-dl="/usr/local/bin/youtube-dl"

URLY="$1"
FILE="$2"

if test "$#" -eq 0; then
    echo "Parameter salah!"
    echo 'Contoh :' "$0" 'https://www.youtube.com/watch?v=cY3EJDH1VUM "Kompas TV Live" '
    exit 1
fi

if test "$#" -gt 2; then
    echo "Parameter salah!"
    echo 'Contoh :' "$0" 'https://www.youtube.com/watch?v=cY3EJDH1VUM "Kompas TV Live" '
    exit 1
fi

# echo $URLY
# echo $FILE

VIDEO=$($youtube-dl $URLY -o '%(id)s.%(ext)s' | grep 'Merging formats into' | cut -d"\"" -f2)

# TODO
# cek file ada sebelum di conversi
# check ffmpeg/youtube-dl sesuai :P

$ffmpeg -i "$VIDEO" "$FILE"
