#!/bin/sh

#只保留最近三天的日志，如需要多保留几天修改8行最后 -n days
#将此脚本加载到系统定时任务中 /etc/crontab
#脚本会读取环境变量，固需要配置环境变量。
#. /etc/profile

day=$(date  +"%Y-%m-%d" -d  "-3 days")

kafka=`jps | grep Kafka | wc -l`
if [[ $kafka = "1" ]];then
    rm -rf $KAFKA_HOME/logs/*.$day*
fi

