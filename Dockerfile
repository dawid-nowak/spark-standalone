#FROM openjdk:8-jdk-alpine
#RUN apk --update add bash 
FROM ubuntu:16.04
MAINTAINER Dawid Nowak <nowakd@gmail.com>>
#RUN apt-get update && apt-get dist-upgrade && apt-get install -y openjdk-8-jdk emacs
RUN apt-get update && apt-get install -y openjdk-8-jdk
#RUN apt-get update && apt-get install -y openjdk-8-jre
#RUN apt-get install -y openjdk-8-jre
#RUN apt-get update && apt-get install -y netbase net-tools netcat iputils-ping

COPY opt/spark-2.1.0-bin-hadoop2.7.tgz /opt/spark-2.1.0-bin-hadoop2.7.tgz
#COPY ./jdk-8u71-linux-x64.tar.gz /opt
#RUN tar xfz /opt/jdk-8u71-linux-x64.tar.gz -C /opt
RUN tar xfz /opt/spark-2.1.0-bin-hadoop2.7.tgz -C /opt
RUN ln -s /opt/spark-2.1.0-bin-hadoop2.7 /opt/spark-latest
#RUN ln -s /opt/jdk1.8.0_71 /opt/java-latest
#ENV JAVA_HOME=/opt/java-latest
COPY ./spark-conf/* /opt/spark-latest/conf/
COPY ./bootstrap.sh /opt/bootstrap.sh
COPY ./bootstrap-master.sh /opt/bootstrap-master.sh
COPY ./bootstrap-slave.sh /opt/bootstrap-slave.sh
RUN rm /opt/*gz
EXPOSE 8080 7077 22222 45000-55000
CMD ["/opt/bootstrap.sh"]