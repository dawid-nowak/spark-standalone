# spark-standalone
Dockerized Apache Spark running in Standalone mode

# running 
Ideally you would run it using docker compose ( see yml file provided). This will ensure that you start master and a worker node and  connect them to a shared data container.

In Spark node common data is mounted at /var/spark_data

```bash
docker-compose --project-name spark build
docker-compose --project-name spark up -d
```

# scaling
With docker-compose adding mode worker nodes is as easy as:

```bash
docker-compose --project-name spark scale spark-node=3

```