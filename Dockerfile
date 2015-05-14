FROM alpine:edge
MAINTAINER Daniel Guerra <danielguerra@gmail.com>

RUN apk add --update bash wget zip && \
    wget http://www.us.apache.org/dist/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz && \
    tar -xvfz kafka_2.10-0.8.2.0.tgz && \
    mv kafka_2.10-0.8.2.0 kafka && \
    rm kafka_2.10-0.8.2.0.tgz && \
    rm /var/cache/apk/* && \

WORKDIR /kafka

CMD ["bin/zookeeper-server-start.sh","config/zookeeper.properties"]
CMD ["bin/zookeeper-server-start.sh","config/server.properties"]
