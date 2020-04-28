#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
# export PASS=$(sed -n '3p' /tmp/.auth)
# docker login -u nohierhassan -p $PASS
cd ~/app && docker-compose up -d

