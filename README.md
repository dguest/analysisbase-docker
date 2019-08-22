More-Better Analysis Base Image
===============================

The analysis base image isn't totally awesome: not because the people who
made it did a bad job, just because it's missing a lot of stuff that I
like. This is an attempt to make it slightly better.

Running
=======

You can pull the latest image and build it with

```
run-docker.sh
```

this should work from anywhere on your system, you don't need to run
from within the source directory.

SSH Keys
--------

By default the run script will pull your keys from `~/.ssh/id_rsa`. If
you want to generate a new key to use just for this container:

 - Open the [gitlab key entry forum](https://gitlab.cern.ch/profile/keys)
 - run `make-key.sh | pbcopy` and paste into the box there

Building
========

You can build your own version by running `build-docker.sh` from
within this repository.

