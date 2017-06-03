#!/bin/bash

# @Create Time: 2017.3.22
# @Author: chicol
# @Description:


#---------- Basic config ----------#
#ip=`ifconfig | grep "inet 172" | awk '{print $2}'`
ip=127.0.0.1
mysql_port=3306
redis_port=6379
zookeeper_port=2181
kafka_port=9092
node_port=3000
nginx_web_port=80
nginx_app_port=8080
export LANG=en_US.UTF-8

# Remove all runit service
rm -rf /etc/service/*

#--- config and initialize mysql ---#
if [ ! -f /opt/important ]; then
    sed -i '/\[mysqld]/a\lower_case_table_names=1' /etc/my.cnf   
    sed -i '/\[mysqld]/a\port='"${mysql_port}"'' /etc/my.cnf   
    sed -i '/\[mysqld]/a\basedir=\/var\/lib\/mysql' /etc/my.cnf   
    sed -i '/^datadir/s/mysql/mysql\/data/g' /etc/my.cnf   
    mkdir -p /var/lib/mysql/share/mysql  
    cp /usr/share/mysql/english/errmsg.sys /var/lib/mysql/share/mysql/errmsg.sys  
fi
/mysqlinit.sh mysqld &
#判断mysqld是否初始化完成并启动成功
for (( i=1;i<=30;i++ ))
do
        sleep 1
        mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "show databases"
        if [ $? -eq 0 ]
        then
                break
        fi
done

if [ ! -f /opt/important ]; then
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "create database iso default character set utf8"
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "create database foxbpm default character set utf8"
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "grant all privileges on *.* to 'root'@'%' identified by '${MYSQL_ROOT_PASSWORD}'"
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "flush privileges"
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} --default-character-set=utf8 iso < /iso.sql
    mysql -uroot -p${MYSQL_ROOT_PASSWORD} --default-character-set=utf8 foxbpm < /foxbpm.sql
# 执行增量脚本/sql语句
    dirpath=/docker-entrypoint-initdb.d/
    execsql="mysql -uroot -p${MYSQL_ROOT_PASSWORD} --default-character-set=utf8"	   
    for f in /docker-entrypoint-initdb.d/*; do
		case "$f" in
				*.sh)                 echo "$0: running $f"; . "$f" ;;
				${dirpath}iso*.sh)    echo "$0: running $f"; ${execsql} iso < "$f" && echo ;;
				${dirpath}foxbpm*.sh) echo "$0: running $f"; ${execsql} foxbpm < "$f" && echo ;;
				*)                    echo "$0: ignoring $f" ;;
		esac
		echo
    done

#---------- Config Redis ----------#
    cd ${REDIS_HOME}
    sed -i '/^appendonly no/s/no/yes/g' redis.conf
    sed -i '/^bind/s/127.0.0.1/'"${ip}"'/g' redis.conf
    sed -i '/dir /s/.\//\/usr\/local\/redis-3.2.5\/data\//g' redis.conf
    sed -i '/logfile/s/""/"\/usr\/local\/redis-3.2.5\/log\/redis.log"/g' redis.conf 

#-------- Config Zookeeper --------#
    cd ${ZOOKEEPER_HOME}
    mkdir zkdata zkdatalog
    cp conf/zoo_sample.cfg conf/zoo.cfg
    sed -i '/^dataDir/s/tmp\/zookeeper/'"${ZOOKEEPER_HOME}"'\/zkdata/g' conf/zoo.cfg
    sed -i '/dataDir/a\dataLogDir='"${ZOOKEEPER_HOME}"'/zkdatalog' conf/zoo.cfg
    echo "server.1=${ip}:${zookeeper_port}" >> conf/zoo.cfg
    echo "1" > ${ZOOKEEPER_HOME}/zkdata/myid

#-------- Config Kafka ------------#
    cd ${KAFKA_HOME}
    mkdir kafkalog kafkaconf
    cd config
    sed -i '/broker.id/s/0/1/g' server.properties
    sed -i '/log.dirs/s/tmp\/kafka-logs/'"${KAFKA_HOME}"'\/kafkalog/g'   server.properties
    sed -i '/zookeeper.connect/s/localhost:2181/'"${ip}"':'"${zookeeper_port}"'/g'  server.properties
    sed -i '/delete.topic.enable/s/#//g' server.properties
    echo "host.name=${ip}"  >> server.properties
    echo "port=${kafka_port}"     >> server.properties
    echo "message.max.byte=5242880"  >> server.properties
    echo "default.replication.factor=1"  >> server.properties
    echo "replica.fetch.max.bytes=5242880"  >> server.properties

#----------- Config admin ------------#
    cd /usr/local/admin
    sed -i '/MysqlPassword/s/123456/'"${MYSQL_ROOT_PASSWORD}"'/g' init.conf
    sed -i '/RedisServer/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}/'"${ip}"'/g'  init.conf
    sed -i '/ZookeeperNodes/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${ip}"':'"${zookeeper_port}"'/g'  init.conf
    sed -i '/KafkaProducerBrokers/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${ip}"':'"${kafka_port}"'/g'  init.conf

#----------- Config authority ----------#
    cd /usr/local/authority
    sed -i '/MysqlPassword/s/123456/'"${MYSQL_ROOT_PASSWORD}"'/g' init.conf
    sed -i '/RedisServer/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}/'"${ip}"'/g'  init.conf
    sed -i '/ZookeeperNodes/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${ip}"':'"${zookeeper_port}"'/g'  init.conf
    sed -i '/KafkaProducerBrokers/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${ip}"':'"${kafka_port}"'/g'  init.conf

#----------- Config isonode ------------#
    cd /usr/local/isonode/config/
    sed -i '/"server"/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${ip}"':'"${zookeeper_port}"'/g'  default.json
    sed -i '/trackerServers/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${TRACKER_SERVER}"'/g'  default.json

#----------- Config isobpm -------------#
    cd /usr/local/isobpm
    sed -i '/datasource.password/s/123456/'"${MYSQL_ROOT_PASSWORD}"'/g' application.properties
    sed -i '/kafka.bootstrap/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${ip}"':'"${kafka_port}"'/g'  application.properties
    sed -i '/fdfs.tracker/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${TRACKER_SERVER}"'/g'  application.properties

#----------- Config isohtml ------------#
    cd /usr/local/isohtml/Content/js/base/
    sed -i '/apiUrl/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${HOST_IP}"':'"${NODE_EXTERNAL_PORT}"'/g'  config.js
    sed -i '/fileUrl/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${HOST_IP}"':'"${NODE_EXTERNAL_PORT}"'/g'  config.js
    sed -i '/docUrl/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${HOST_IP}"':'"${NODE_EXTERNAL_PORT}"'/g'  config.js
	
#----------- Config logstash -----------#
    cd /etc/logstash/conf.d/
    sed -i '/hosts/s/[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}\.[0-9]\{,3\}:[0-9]\{1,5\}/'"${HOST_EK}"'/g' log2es.conf

fi

#------ start runit service ------------#
/usr/sbin/runsvdir-start &
sleep 1

#--------- config runit service --------#
ln -s /etc/runit/redis /etc/service/redis
ln -s /etc/runit/zookeeper /etc/service/zookeeper
for i in 1 2 3 4 5
do
	ps -ef | grep Dzookeeper | grep -v grep
	if [ $? = 0 ]
	then
		sleep 1
		ln -s /etc/runit/kafka /etc/service/kafka
		break
	else
		sleep 2
	fi
done
# Create kafka topic
if [ ! -f /opt/important ]; then
	for i in 1 2 3 4 5
	do
		ps -ef | grep Dkafka | grep -v grep
		if [ $? = 0 ];
		then
			sleep 5
			cd ${KAFKA_HOME}
			bin/kafka-topics.sh --create --zookeeper ${ip} --replication-factor 1 --partitions 1 --topic adminserver
			bin/kafka-topics.sh --create --zookeeper ${ip} --replication-factor 1 --partitions 1 --topic adminserverret
			bin/kafka-topics.sh --create --zookeeper ${ip} --replication-factor 1 --partitions 1 --topic authserver
			bin/kafka-topics.sh --create --zookeeper ${ip} --replication-factor 1 --partitions 1 --topic node2bpm
			bin/kafka-topics.sh --create --zookeeper ${ip} --replication-factor 1 --partitions 1 --topic bpm2node
			bin/kafka-topics.sh --create --zookeeper ${ip} --replication-factor 1 --partitions 1 --topic nodejsserver
			break
		else
			sleep 2
		fi
	done
fi
sleep 1
for i in 1 2 3 4 5
do
        ps -ef | grep Dkafka | grep -v grep
        if [ $? = 0 ]
        then
		sleep 1
		ln -s /etc/runit/admin /etc/service/admin
		ln -s /etc/runit/authority /etc/service/authority
		ln -s /etc/runit/isonode /etc/service/isonode
		ln -s /etc/runit/isobpm /etc/service/isobpm
		ln -s /etc/runit/elasticsearch /etc/service/elasticsearch
		ln -s /etc/runit/logstash /etc/service/logstash
        break
        else
                sleep 2
        fi
done

# Generate label file when create container first time
if [ ! -f /opt/important ]; then
    echo -e "please don't modify this file!!!!!!" > /opt/important
fi

#------------- start nginx -----------#
nginx

wait 

