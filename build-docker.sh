#!/usr/bin/env bash

TAG=85
NAME=danalysis

docker build docker --build-arg TAG=$TAG -f docker/combined.Dockerfile \
       -t ${NAME}:${TAG} \
       -t ${NAME}:latest \
       -t ${USER-bob}/${NAME}:${TAG} \
       -t ${USER-bob}/${NAME}:latest



