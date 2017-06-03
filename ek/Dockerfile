FROM docker.zifang.com/centos:7.3.1611
LABEL maintainer chicol "chicol@yeah.net"

COPY runit /etc/runit
COPY *.sh /

RUN /setup.sh 

COPY config /usr/share/elasticsearch/config

VOLUME /usr/share/elasticsearch/data

ENV PATH /usr/share/elasticsearch/bin:/usr/share/kibana/bin:$PATH

EXPOSE 9200 9300 5601

ENTRYPOINT ["/startup.sh"]
