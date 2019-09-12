#!/usr/bin/env bash

mkdir -p settings/ssh
rm -f settings/ssh/*
ssh-keygen -f settings/ssh/gitlab -N '' -C "${USER-docker}_gitlab_key" -q
cat settings/ssh/gitlab.pub
