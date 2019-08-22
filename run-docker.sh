#!/usr/bin/env bash

get-ssh() {
    local TARG=${2-$1}
    mkdir -p settings/ssh
    if ! [[ -f settings/ssh/$TARG ]]; then
        echo "getting $TARG"
        cp ~/.ssh/$1 settings/ssh/$TARG
    fi
}
get-ssh id_rsa gitlab
get-ssh id_rsa.pub gitlab
get-ssh known_hosts

if ! [[ -f settings/ssh/config ]]; then
    cp ssh-default/config settings/ssh
fi

mkdir -p settings/git
if ! [[ -f settings/git/config ]]; then
    cp ~/.gitconfig settings/git/config
fi

docker run --rm -it \
       -v $PWD/settings:/home/atlas/settings \
       -v $PWD/work:/workdir \
       danalysis

