#!/bin/bash
 
cd /usr/iqeq/xxl_job_executor

BIN_DIR=`pwd`
$BIN_DIR/bin/stop.sh
$BIN_DIR/bin/stop.sh
$BIN_DIR/bin/stop.sh
$BIN_DIR/bin/start.sh

exit 0