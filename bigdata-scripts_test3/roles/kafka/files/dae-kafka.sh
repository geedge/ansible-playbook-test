#!/bin/sh

#修改BASE_DIR为安装的路径
#启动命令端口可自行指定
#JMX_PORT=9191 nohup $BASE_DIR/bin/kafka-server-start.sh $BASE_DIR/config/server.properties > /dev/null 2>&1 &

PRO_NAME=Kafka
BASE_DIR=$1
VERSION="kafka_2.11-1.0.0"

#string=`cat $BASE_DIR/$VERSION/config/server.properties | grep broker.id`
#array=(${string//=/ })
#echo ${array[1]}
#ssh root@192.168.40.123 "source /etc/profile ; zkCli.sh ls /kafka/brokers/ids | grep -v 2181 | grep 4 | wc -l"
source /etc/profile
while true ; do
    NUM=`jps | grep -w ${PRO_NAME} | grep -v grep |wc -l`
    
    if [ "${NUM}" -lt "1" ];then
	JMX_PORT=9191 nohup $BASE_DIR/$VERSION/bin/kafka-server-start.sh $BASE_DIR/$VERSION/config/server.properties > /dev/null 2>&1 &
        OLD_NUM=`cat $BASE_DIR/$VERSION/logs/restart_sum.log`
        RESTART_NUM=`expr $OLD_NUM + 1`
        echo $RESTART_NUM > $BASE_DIR/$VERSION/logs/restart_sum.log
        echo "`date "+%Y-%m-%d %H:%M:%S"` - kafka服务启动/异常重启 - 重启次数 -> $RESTART_NUM" >> $BASE_DIR/$VERSION/restart.log
	#大于1，杀掉所有进程，重启
    elif [ "${NUM}" -gt "1" ];then
        killall -9 ${PRO_NAME}
    fi
	sleep 60
done
