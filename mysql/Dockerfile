FROM docker.zifang.com/centos:7.3.1611
LABEL maintainer chicol "chicol@yeah.net"
RUN cd /usr/local/src/  \
&&  yum makecache fast  \
&&  yum install -y wget libaio numactl-libs \
&&  wget  \
    http://repo.mysql.com/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm \
&&  yum install -y mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm  \
&&  rm -f mysql-community-server-minimal-5.7.17-1.el7.x86_64.rpm  \
&&  yum clean all
RUN sed -i '/\[mysqld]/a\lower_case_table_names=1' /etc/my.cnf  \
&&  sed -i '/\[mysqld]/a\port=3306' /etc/my.cnf  \
&&  sed -i '/\[mysqld]/a\basedir=\/var\/lib\/mysql' /etc/my.cnf  \
&&  sed -i '/^datadir/s/mysql/mysql\/data/g' /etc/my.cnf  \
&&  mysqld --defaults-file=/etc/my.cnf --initialize-insecure  \
#&&  mysqld &  \
&&  echo "[program:mysql]" >> /etc/supervisord.d/mysql.ini  \
&&  echo "command=/usr/sbin/mysqld" >> /etc/supervisord.d/mysql.ini  \
&&  echo "autostart=true" >> /etc/supervisord.d/mysql.ini  \
&&  echo "autorestart=true" >> /etc/supervisord.d/mysql.ini

