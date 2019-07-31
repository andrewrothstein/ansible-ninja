#!/usr/bin/env sh
VER=v1.9.0
DIR=~/Downloads
MIRROR=https://github.com/ninja-build/ninja/releases/download

dl()
{
    OS=$1
    RFILE=ninja-${OS}.zip
    LFILE=ninja-${VER}-${OS}.zip
    URL=$MIRROR/$VER/$RFILE
    LFILE=$DIR/$LFILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $OS `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl linux
dl mac
dl win


