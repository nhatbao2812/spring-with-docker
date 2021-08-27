#run project
cd docker
./build-docker.sh
docker-compose up
localhost:8080/hello/staff

#build gradle and run
./gradlew build && java -jar build/libs/spring-with-docker-0.0.1.jar

# build docker
docker build --build-arg JAR_FILE=build/libs/\*.jar -t springio/spring-boot-app .

https://www.codenotary.com/blog/extremely-useful-docker-commands/
kill all running containers with: docker kill $(docker ps -q)
delete all stopped containers with: docker rm $(docker ps -a -q)
delete all images with: docker rmi $(docker images -q)

