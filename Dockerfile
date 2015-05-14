FROM alpine:edge
MAINTAINER Daniel Guerra <danielguerra@gmail.com>

RUN apk add --update bash zip curl java-gcj-compat&& \
    curl http://www.us.apache.org/dist/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz| tar -xzf - && \
    mv kafka_2.10-0.8.2.0 /kafka && \
    mkdir /tmp/zookeeper && \
    rm /var/cache/apk/*

WORKDIR /kafka
EXPOSE 9092
CMD ["bin/zookeeper-server-start.sh","config/zookeeper.properties"]
CMD ["bin/zookeeper-server-start.sh","config/server.properties"]
