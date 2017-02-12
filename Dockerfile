FROM openjdk:8-jdk
MAINTAINER Dawid Nowak <nowakd@gmail.com>>
COPY opt/spark-2.1.0-bin-hadoop2.7.tgz /opt/spark-2.1.0-bin-hadoop2.7.tgz
RUN tar xfz /opt/spark-2.1.0-bin-hadoop2.7.tgz -C /opt
RUN ln -s /opt/spark-2.1.0-bin-hadoop2.7 /opt/spark-latest
COPY ./spark-conf/* /opt/spark-latest/conf/
COPY ./bootstrap.sh /opt/bootstrap.sh
COPY ./bootstrap-master.sh /opt/bootstrap-master.sh
COPY ./bootstrap-slave.sh /opt/bootstrap-slave.sh
RUN rm /opt/*gz
EXPOSE 8080 7077 22222 45000-55000
CMD ["/opt/bootstrap.sh"]