#!/usr/bin/env bash

# we only get the ssh keys from your area if you haven't created them
# and put them in `settings/ssh`
get-ssh() {
    local TARG=${2-$1}
    mkdir -p settings/ssh
    if ! [[ -f settings/ssh/$TARG ]]; then
        echo "getting $TARG from ~/.ssh"
        cp ~/.ssh/$1 settings/ssh/$TARG
    fi
}
get-ssh id_rsa gitlab
get-ssh id_rsa.pub gitlab
get-ssh known_hosts

# load in the ssh config files
if ! [[ -f settings/ssh/config ]]; then
    cp $(dirname ${BASH_SOURCE[0]})/ssh-default/config settings/ssh
fi

# load the user's git configuration
mkdir -p settings/git
if ! [[ -f settings/git/config ]]; then
    if ! [[ -f ~/.gitconfig ]]; then
        cat <<EOF >&2
missing a .gitconfig, create one with git config, i.e. running

git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

EOF
        exit 1
    fi
    cp ~/.gitconfig settings/git/config
fi

docker run --rm -it \
       -v $PWD/settings:/home/atlas/settings \
       -v $PWD/work:/workdir \
       -e USER=$USER \
       ${USER-bob}/danalysis

