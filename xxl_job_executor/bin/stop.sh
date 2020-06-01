#!/bin/bash

SERVER_NAME='xxl_job_executor'
# jar名称
cd /usr/iqeq/xxl_job_executor

DEPLOY_DIR=`pwd`
BIN_DIR=$DEPLOY_DIR/lib
CONF_DIR=$DEPLOY_DIR/config


PIDS=`ps -ef | grep java | grep "$DEPLOY_DIR" |awk '{print $2}'`
if [ -z "$PIDS" ]; then
    echo "ERROR: The $SERVER_NAME does not started!"
    exit 1
fi

# if [ "$1" != "skip" ]; then
#     $BIN_DIR/dump.sh
# fi

echo -e "Stopping the $SERVER_NAME ...\c"
for PID in $PIDS ; do
    kill $PID > /dev/null 2>&1
done

COUNT=0
while [ $COUNT -lt 1 ]; do
    echo -e ".\c"
    sleep 1
    COUNT=1
    for PID in $PIDS ; do
        PID_EXIST=`ps -f -p $PID | grep java`
        if [ -n "$PID_EXIST" ]; then
            COUNT=0
            break
        fi
    done
done

echo "OK!"
echo "PID: $PIDS"