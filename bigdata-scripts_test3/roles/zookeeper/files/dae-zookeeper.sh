#!/bin/sh

#进程名称
PRO_NAME=QuorumPeerMain
#安装路径
BASE_DIR=$1
VERSION="zookeeper-3.4.9"
source /etc/profile
while true ; do
    NUM=`$BASE_DIR/$VERSION/bin/zkServer.sh status | egrep 'leader|follower' | wc -l`
    if [ "${NUM}" -lt "1" ];then
	$BASE_DIR/$VERSION/bin/zkServer.sh start
        OLD_NUM=`cat $BASE_DIR/$VERSION/logs/restart_sum.log`
        RESTART_NUM=`expr $OLD_NUM + 1`
        echo $RESTART_NUM > $BASE_DIR/$VERSION/logs/restart_sum.log
        echo "`date "+%Y-%m-%d %H:%M:%S"` - zookeeper服务启动/异常重启 - 重启次数 -> $RESTART_NUM" >> $BASE_DIR/$VERSION/restart.log
	#大于1，杀掉所有进程，重启
    elif [ "${NUM}" -gt "1" ];then
        killall-9 ${PRO_NAME}
    fi
	sleep 60
done
