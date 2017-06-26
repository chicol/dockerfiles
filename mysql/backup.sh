#!/bin/bash
# @Create Time: 2017-6-26 
# @Author: Chicol
# @Function: backup docker container data every day with crontab

#*********** 备份mysql数据库 ***********
mkdir -p /data/mysql/mysql-$(date +%F)
mysqldump -uroot -p${MYSQL_ROOT_PASSWORD} --all-databases > /data/mysql/mysql-$(date +%F)/mysql.sql

#判断备份路径是否存在
backuppath="/data/mysql"
if [ -d ${backuppath} ]; then

    dir_total=`expr $(ls -l ${backuppath} | wc -l) - 1`   #计算当前备份文件夹的个数
    if [ ${dir_total} -gt 10 ]; then
        dir_delete=`expr ${dir_total} - 10`                #计算需要删除的文件夹个数
        ls -lhr ${backuppath} | tail -${dir_delete} | awk '{print $9}' | xargs -t -i rm -rf ${backuppath}/{}  #删除10天之前的备份文件
    fi
fi
