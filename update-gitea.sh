#!/usr/bin/env bash

# sesuaikan GITEAPATH dengan folder tempat install gitea
GITEAPATH="$HOME"

GITEAVERSION=$($GITEAPATH/gitea -v | cut -d ' ' -f 3)

GITEALATESTVERSION=$(curl -s https://github.com/go-gitea/gitea/releases/latest | sed 's#.*tag/\(.*\)\".*#\1#' | sed 's/v//1')

VER=$(echo -e "${GITEAVERSION}\n${GITEALATESTVERSION}" | sort -V -r | head -n 1)

if [ "$VER" != "$GITEAVERSION" ]; then
    cd "$GITEAPATH" || exit
    rm -f gitea
    wget "https://github.com/go-gitea/gitea/releases/download/v${GITEALATESTVERSION}/gitea-${GITEALATESTVERSION}-linux-amd64" -O "$GITEAPATH/gitea"
    chmod +x "$GITEAPATH/gitea"
    # kill prosess gitea
    pkill gitea
    nohup $GITEAPATH/gitea web > /dev/null 2>&1 &

fi
