#!/bin/bash

# stop on fail
set -e
cd ..
# variables
TARGET="target"
APP="./app"

# build app
./gradlew build

docker build --build-arg JAR_FILE=$TARGET/\*.jar -t springio/spring-boot-app .

# find jar
APP_JAR=$(ls $TARGET | grep ".jar$")

echo "Copy JAR: $APP_JAR"

# copy JAR file
cp $TARGET/$APP_JAR $APP/app.jar

# change dir
cd $APP

# stop and destroy current application Docker stack
docker-compose down

# rebuild image
docker-compose build

# remove empty image, just for keep clean in Docker
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

# success
echo "DONE"