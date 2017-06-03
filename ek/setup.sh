#!/bin/bash

set -e

# Create groups
groupadd -g 996 elasticsearch
groupadd -g 995 kibana

# Create accounts
useradd -m -u 996 -g elasticsearch -m -s /bin/sh -d /usr/share/elasticsearch elasticsearch
useradd -m -u 995 -g kibana -m -s /bin/sh -d /usr/share/kibana kibana

# create directory
mkdir -p /etc/runit

# install soft
cd /tmp/  
curl -s https://packagecloud.io/install/repositories/imeyer/runit/script.rpm.sh | bash  
yum makecache fast  
yum -y install wget java-1.8.0-openjdk runit
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.rpm  
rpm --install elasticsearch-5.4.0.rpm  
wget https://artifacts.elastic.co/downloads/kibana/kibana-5.4.0-x86_64.rpm  
rpm --install kibana-5.4.0-x86_64.rpm  
rm -f elasticsearch-5.4.0.rpm kibana-5.4.0-x86_64.rpm  
yum clean all

# config elasticsearch and kibana
set -ex  
cd /usr/share/elasticsearch
for path in ./data ./logs ./config ./config/scripts ; do  
	mkdir -p "$path"; 
        chown -R elasticsearch:elasticsearch "$path";  
done  

# the default "server.host" is "localhost" in 5+
sed -ri "s!^(\#\s*)?(server\.host:).*!\2 '0.0.0.0'!" /etc/kibana/kibana.yml  

# ensure the default configuration is useful when using --link

sed -i '/elasticsearch.url/s/#//g' /etc/kibana/kibana.yml

