FROM openjdk:8-jdk

VOLUME /tmp

ARG JAR_FILE=target/*.jar

ADD ${JAR_FILE} app.jar

ADD entrypoint.sh entrypoint.sh

RUN sh -c 'touch /app.jar'

ENTRYPOINT [ "sh", "./entrypoint.sh" ]