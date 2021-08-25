#!/bin/bash

# java ops arguments
export JAVA_OPTS=""

# sleep for DB up
SLEEP=15

echo "App wait $SLEEP sec until DB up first..."

# wait
sleep $SLEEP

# start app
java -jar /app.jar