FROM docker.zifang.com/zfisobase
LABEL maintainer chicol "chicol@yeah.net"

COPY startup.sh /
COPY runit /etc/runit/

COPY *.sql /
ADD *.gz /usr/local/
RUN  cd /tmp/  \
&&   wget ${HTTP_SERVER}/admin.tar.gz  \
&&   wget ${HTTP_SERVER}/authority.tar.gz  \
&&   wget ${HTTP_SERVER}/isonode.tar.gz  \
&&   wget ${HTTP_SERVER}/isobpm.tar.gz  \
&&   wget ${HTTP_SERVER}/isohtml.tar.gz  \
&&   tar xzvf admin.tar.gz -C /usr/local/  \
&&   tar xzvf authority.tar.gz -C /usr/local/  \
&&   tar xzvf isonode.tar.gz -C /usr/local/  \
&&   tar xzvf isobpm.tar.gz -C /usr/local/  \
&&   tar xzvf isohtml.tar.gz -C /usr/local/  \
&&   rm -f admin.tar.gz authority.tar.gz isonode.tar.gz \
     isobpm.tar.gz isohtml.tar.gz 

ENTRYPOINT ["/startup.sh"]
