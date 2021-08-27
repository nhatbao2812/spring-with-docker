#!/bin/bash

# stop on fail
set -e
cd ..

# build app
./gradlew clean build
./gradlew copyjar

cd docker
docker build --build-arg JAR_FILE=\*.jar -t springio/spring-boot-app .

# shellcheck disable=SC2035
rm *.jar

# stop and destroy current application Docker stack
docker-compose down

# rebuild image
docker-compose build

# remove empty image, just for keep clean in Docker
# shellcheck disable=SC2046
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

# success
echo "DONE"