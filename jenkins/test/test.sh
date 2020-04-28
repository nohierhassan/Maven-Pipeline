#!/bin/bash
##########################################################
##      a script to automate the creation of the jar file , we will do this inside a container based on maven image
echo "***************************"
echo "*****  Testing the Code ********"
echo "***************************"
WORKSPACE="/home/non/Documents/Jenkins Course/NEW/Section 1/jenkins-data/jenkins_home/workspace/maven-pipeline"

docker run --rm -v "$WORKSPACE/maven-project:/app" -v "/root/.m2/:/root/.m2/" -w /app maven:3-alpine "$@"
