#!/bin/bash

echo "Docker Spark Bootstrap"
if [ "$SPARK_MODE" = "master" ]
then
    echo "Running as Master"
    /opt/spark-latest/sbin/start-master.sh
else
    echo "Running as Worker" 
    /opt/spark-latest/sbin/start-slave.sh spark-master:7077  
fi
while true; do sleep 1000; done
