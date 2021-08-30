#run project
cd docker
./build-docker.sh
docker-compose up
localhost:8080/hello/staff

#build gradle and run
./gradlew build && java -jar build/libs/spring-with-docker-0.0.1.jar

# build docker
docker build --build-arg JAR_FILE=build/libs/\*.jar -t springio/spring-boot-app .

#run individual
docker network create -d bridge employee-db
docker run -p 5433:5432 -d -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=company -e PGDATA=/var/lib/postgresql/data/pgdata --name postgres --network="employee-db"  postgres:latest
docker run -p 8080:8080 --network="employee-db" springio/spring-boot-app

#additional info
https://www.codenotary.com/blog/extremely-useful-docker-commands/
kill all running containers with: docker kill $(docker ps -q)
delete all stopped containers with: docker rm $(docker ps -a -q)
delete all images with: docker rmi $(docker images -q)

