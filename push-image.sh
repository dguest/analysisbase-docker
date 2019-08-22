#!/usr/bin/env bash

docker tag danalysis ${USER}/danalysis
docker push ${USER}/danalysis:latest
