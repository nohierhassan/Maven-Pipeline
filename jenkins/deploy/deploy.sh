#!/bin/bash
# PASS=$1
echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
# echo $PASS >> /tmp/.auth
scp -i aws-key-3.pem /tmp/.auth ec2-user@ec2-3-84-27-111.compute-1.amazonaws.com:/tmp/.auth
scp -i aws-key-3.pem jenkins/deploy/publish.sh ec2-user@ec2-3-84-27-111.compute-1.amazonaws.com:~/app/
ssh -i aws-key-3.pem ec2-user@ec2-3-84-27-111.compute-1.amazonaws.com "~/app/publish.sh"
