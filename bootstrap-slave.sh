#!/bin/bash
/opt/spark-latest/sbin/start-slave.sh spark-master:7077  
while true; do sleep 1000; done
