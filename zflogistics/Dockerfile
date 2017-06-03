FROM docker.zifang.com/centos:7.3.1611
LABEL maintainer chicol "chicol@yeah.net"
ADD ./entrypoint* /
RUN yum makecache fast  \
&&  mkdir /docker-entrypoint-initdb.d  \
&&  yum install -y wget java-1.8.0-openjdk  \
&&  cd /usr/local/src/  \
&&  wget  \
    http://repo.mysql.com/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm \
&&  wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz  \
&&  yum install -y mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm  \
&&  mkdir -p /usr/local/tomcat/  \
&&  tar xzvf /usr/local/src/apache-tomcat-7.0.77.tar.gz --strip-components=1 -C /usr/local/tomcat/   \
&&  rm -f mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm  \
&&  rm -f apache-tomcat-7.0.77.tar.gz  \
&&  yum clean all  \
&&  rm -rf /var/cache/yum/* 
RUN sed -i '/\[mysqld]/a\lower_case_table_names=1' /etc/my.cnf  \
&&  sed -i '/\[mysqld]/a\port=3306' /etc/my.cnf  \
&&  sed -i '/\[mysqld]/a\basedir=\/var\/lib\/mysql' /etc/my.cnf  \
&&  sed -i '/^datadir/s/mysql/mysql\/data/g' /etc/my.cnf  \
&&  mkdir -p /var/lib/mysql/share/mysql  \
&&  cp /usr/share/mysql/english/errmsg.sys /var/lib/mysql/share/mysql/errmsg.sys  \
&&  echo "[program:mysql]" >> /etc/supervisord.d/mysql.ini  \
&&  echo "command=/usr/sbin/mysqld" >> /etc/supervisord.d/mysql.ini  \
&&  echo "autostart=true" >> /etc/supervisord.d/mysql.ini  \
&&  echo "autorestart=true" >> /etc/supervisord.d/mysql.ini
VOLUME /var/lib/mysql
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]
