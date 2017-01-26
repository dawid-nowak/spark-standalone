#!/bin/bash
echo "Docker Spark Bootstrap"
nohup /opt/spark-latest/sbin/start-master.sh
echo "For some reason leaving here "
while true; do sleep 1000; done




