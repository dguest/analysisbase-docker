#!/usr/bin/env bash

get-ssh() {
    local TARG=${2-$1}
    mkdir -p settings/ssh
    if ! [[ -f settings/ssh/$TARG ]]; then
        echo "getting $TARG"
        cp ~/.ssh/$1 settings/ssh/$TARG
    fi
}
get-ssh config
get-ssh id_rsa
get-ssh id_rsa.pub
get-ssh known_hosts

mkdir -p settings/git
if ! [[ -f settings/git/config ]]; then
    cp ~/.gitconfig settings/git/config
fi

docker run --rm -it -v $PWD/settings:/home/atlas/settings danalysis:85

