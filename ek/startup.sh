#!/bin/bash

rm -f /etc/service/*

/usr/sbin/runsvdir-start &
sleep 1

#--------- config runit service --------#
ln -s /etc/runit/elasticsearch /etc/service/elasticsearch
ln -s /etc/runit/kibana /etc/service/kibana

wait
