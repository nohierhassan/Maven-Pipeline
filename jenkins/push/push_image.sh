#!/bin/bash
echo "*************************"
echo "*** Pushing the image ***"
echo "*************************"
USER_NAME=$1
PASSWORD=$2
IMAGE="maven-project"
echo "*** Logging In ***"
docker login -u $USER_NAME -p $PASSWORD

echo "**** Taging the Image ****"
docker tag $IMAGE:$BUILD_TAG nohierhassan/$IMAGE:$BUILD_TAG

echo "**** Pushing Image to Docker Hub *** " 
docker push nohierhassan/$IMAGE:$BUILD_TAG

