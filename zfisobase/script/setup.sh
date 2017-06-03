#!/bin/bash

# @Create Time: 2017.3.22
# @Author: chicol
# @Description:

# Create groups
groupadd -g 996 elasticsearch

# Create accounts
useradd -m -u 996 -g elasticsearch -m -s /bin/sh -d /usr/share/elasticsearch elasticsearch

# Install software 
yum makecache fast  
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch  
curl -s https://packagecloud.io/install/repositories/imeyer/runit/script.rpm.sh | bash
yum -y install gcc gcc-c++ make unzip wget nginx which java-1.8.0-openjdk runit

# Download install package
cd /tmp/
wget ${HTTP_SERVER}/${logstash}
wget ${HTTP_SERVER}/${mysql}
wget ${HTTP_SERVER}/${redis}
wget ${HTTP_SERVER}/${zookeeper}
wget ${HTTP_SERVER}/${kafka}
wget ${HTTP_SERVER}/${elasticsearch}
wget ${HTTP_SERVER}/${node}
wget ${HTTP_SERVER}/node_modules.tar.gz
wget ${HTTP_SERVER}/elasticsearch-analysis-ik-1.10.3.zip

yum -y install ${logstash} ${mysql}
yum clean all
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

tar xzvf /tmp/${zookeeper} -C /usr/local/
tar xzvf /tmp/${kafka} -C /usr/local/
tar xzvf /tmp/${redis} -C /usr/local/
tar xzvf /tmp/${elasticsearch} -C /usr/local/
tar xzvf /tmp/${node} -C /usr/local/
tar xzvf /tmp/node_modules.tar.gz -C /usr/local/isonode/
mkdir -p ${ES_HOME}/plugins/ik
unzip elasticsearch-analysis-ik-1.10.3.zip -d ${ES_HOME}/plugins/ik/

# clean compress files
cd /tmp/
rm -f ${logstash} ${mysql} ${redis} ${zookeeper} ${kafka} ${elasticsearch} \
      ${node} node_modules.tar.gz elasticsearch-analysis-ik-1.10.1.zip

# Compile redis
cd ${REDIS_HOME}
make  
make install  
mkdir -p data log

# config elasticsearch 
set -ex  
cd ${ES_HOME}
for path in ./data ./logs ./plugins ./config ./config/scripts ; do  
        mkdir -p "$path"; 
        chown -R elasticsearch:elasticsearch "$path";  
done  
cd config
mv elasticsearch.yml elasticsearch.yml.bak

export LANG=en_US.UTF-8
