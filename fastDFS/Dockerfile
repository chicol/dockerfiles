FROM docker.zifang.com/centos:7.3.1611
MAINTAINER chicol "chicol@yeah.net"
# copy install package files from localhost.
ADD ./libfastcommon-master.tar.gz /usr/local/src
ADD ./FastDFS_v5.08.tar.gz /usr/local/src
# Install dependency lib files.
RUN yum -y install make cmake gcc gcc-c++ which perl  \
&&  cd /usr/local/src/libfastcommon-master/   \
&&  ./make.sh  \
&&  ./make.sh install   \
&&  cd /usr/local/src/FastDFS   \
&&  ./make.sh  \
&&  ./make.sh  install   \
&&  yum clean all  
