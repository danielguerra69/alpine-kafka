FROM alpine:edge
MAINTAINER Daniel Guerra <danielguerra@gmail.com>

RUN apk add --update bash zip curl java-gcj-compat&& \
    curl http://www.us.apache.org/dist/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz| tar -xzf - && \
    mv kafka_2.10-0.8.2.0 /kafka && \
    rm /var/cache/apk/*
RUN mkdir /tmp/zookeeper
RUN mkdir /tmp/kafka-logs
VOLUME ["/data"]
ENV KAFKA_HOME /kafka
ENV PATH /kafka:$PATH
WORKDIR /kafka
ADD run.sh /kafka/run.sh
RUN chmod a+x /kafka/run.sh
EXPOSE 9092
EXPOSE 2181   
CMD ["run.sh"]
