#!/usr/bin/env bash

TAG=85

docker build docker --build-arg TAG=$TAG -f docker/combined.Dockerfile \
       -t danalysis:${TAG}


