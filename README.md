# spark-standalone
Dockerized Apache Spark running in Standalone mode

# running 
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