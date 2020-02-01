#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/ninja-build/ninja/releases/download

dl()
{
    local ver=$1
    local os=$2
    local url=$MIRROR/$ver/ninja-${os}.zip
    local lfile=$DIR/ninja-${ver}-${os}.zip

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $os $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux
    dl $ver mac
    dl $ver win
}

dl_ver ${1:-v1.10.0}
