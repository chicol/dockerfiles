FROM docker.zifang.com/centos:7.3.1611
LABEL maintainer chicol "chicol@yeah.net"

COPY script/*.sh /

RUN mkdir -p /data /docker-entrypoint-initdb.d /etc/runit /var/log/iso /usr/local/isonode \
&&  cd /var/log/iso  \
&&  mkdir redis zookeeper kafka admin authority isonode isobpm nginx

ENV redis=redis-3.2.5.tar.gz zookeeper=zookeeper-3.4.9.tar.gz kafka=kafka_2.11-0.10.1.1.tgz \
    node=node-v6.2.2-linux-x64.tar.gz elasticsearch=elasticsearch-2.4.3.tar.gz \
    logstash=logstash-5.4.0.rpm mysql=mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm \
    runit=runit-2.1.2.tar.gz \
    REDIS_HOME=/usr/local/redis-3.2.5 ZOOKEEPER_HOME=/usr/local/zookeeper-3.4.9  \
    KAFKA_HOME=/usr/local/kafka_2.11-0.10.1.1 NODE_HOME=/usr/local/node-v6.2.2-linux-x64 \
    ES_HOME=/usr/local/elasticsearch-2.4.3 RUNIT_HOME=/usr/local/runit-2.1.2
ENV HTTP_SERVER=192.168.1.15:8090
   
RUN /setup.sh

COPY config/nginx.conf /etc/nginx/
COPY config/iso.conf /etc/nginx/conf.d/
COPY config/log2es.conf /etc/logstash/conf.d/
COPY config/elasticsearch.yml ${ES_HOME}/config/
COPY config/log4j2.properties ${ES_HOME}/config/

ENV PATH=${REDIS_HOME}/bin/:${ZOOKEEPER_HOME}/bin/:${KAFKA_HOME}/bin:${ES_HOME}/bin:$PATH
ENV LANG=en_US.UTF-8

EXPOSE 9200 9300

ENTRYPOINT ["/mysqlinit.sh"]

CMD ["/bin/bash"]
