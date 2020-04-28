#!/bin/bash
##########################################
##	a script to automate the creation of the app container , which will serve the our java application 
cp maven-project/target/*.jar jenkins/build
echo "*****************************"
echo "** Building the Image ***"
echo "*****************************"
cd jenkins/build/
docker-compose build --no-cache
