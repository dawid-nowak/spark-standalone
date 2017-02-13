# spark-standalone
Dockerized Apache Spark running in Standalone mode

# running with compose
Ideally you would run it using docker compose ( see yml file provided). This will ensure that you start master and a worker node on the same network so they can see each other.

Also all nodes can share data via a shared container mounted at **/var/spark_data**

```bash
docker-compose --project-name spark build
docker-compose --project-name spark up -d
```

# scaling
With docker-compose adding mode worker nodes is as easy as:g

```bash
docker-compose --project-name spark scale spark-node=3
```

# running with docker
Following commands should do the trick assuming that you have a docker network called **spark_default** created
```
docker volume create spark-shared
docker run -d --rm  --network spark_default -e "SPARK_MODE=master"  --name spark-master --volume spark-shared:/var/spark_data dawidnowak/spark-standalone:2.1
docker run -d --rm  --network spark_default --name spark-node1 --volume spark-shared:/var/spark_data dawidnowak/spark-standalone:2.1
docker cp yourfiles spark-master:/var/spark_data
```