FROM dockerfile/java:oracle-java7
MAINTAINER Harald Westphal <h.westphal@gmx.de>

ADD log4j.properties.patch /tmp/log4j.properties.patch
ADD kafka-run-class.sh.patch /tmp/kafka-run-class.sh.patch

RUN \
  wget -q -O - http://apache.proserve.nl/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz | tar -zxf - -C / && \
  mv /kafka_2.9.2-0.8.1.1 /kafka && \
  patch /kafka/config/log4j.properties </tmp/log4j.properties.patch && \
  patch /kafka/bin/kafka-run-class.sh </tmp/kafka-run-class.sh.patch

EXPOSE 9092

ENV LOG_DIR /data/log

WORKDIR /data

VOLUME ["/data"]

CMD ["/kafka/bin/kafka-server-start.sh", "/data/kafka.properties"]
