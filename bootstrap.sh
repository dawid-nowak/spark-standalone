#!/bin/bash

echo "Docker Spark Bootstrap"
if [ "$SPARK_MODE" = "master" ]
then
    echo "Running as Master"
    /opt/spark-latest/sbin/start-master.sh
else
    echo "Running as Worker $SPARK_MASTER_IP" 
    /opt/spark-latest/sbin/start-slave.sh spark-master:7077  
fi
cat
