## Kafka Dockerfile


This repository contains **Dockerfile** of [Kafka](http://kafka.apache.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/hwestphal/kafka/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/java:oracle-java7](http://dockerfile.github.io/#/java)


### Usage

Create a Kafka data directory on your host and put there a [`kafka.properties`](http://kafka.apache.org/documentation.html#configuration) file, then

    docker run -d -p 9092:9092 -v <persistent-data-dir>:/data hwestphal/kafka
