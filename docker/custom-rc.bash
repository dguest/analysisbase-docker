# bashrc file for the images

# set up command line
PS1='\[\033[01;31m\][\h:\u]\[\033[01;32m\]:\W>\[\033[00m\] '
CLICOLOR=1

# add dan's utils
for SCRIPT in /etc/dguest/*; do
    source $SCRIPT
done
unset SCRIPT

# enable tab complete
source /etc/profile.d/bash_completion.sh
source /home/atlas/release_setup.sh > /dev/null

cp /home/atlas/settings/git/config ~/.gitconfig
cp -r /home/atlas/settings/ssh ~/.ssh

HISTFILE=/workdir/.bash_history
HISTFILESIZE=""
HISTSIZE=""
DIRECTORY_STACK_FILE=/workdir/.WORKING_DIRECTORY_STACK
load-dir-stack

# aliases
alias ls='ls --color=auto'
