#!/bin/bash

ulimit -n 65535
ulimit -c unlimited

# 如果是debug模式
if [ "$MODE == 'DEBUG'" ]; then
	if [ -f "conf/debug/print.log" ]; then
		rm conf/debug/print.log
	fi
	touch conf/debug/print.log
    nohup ./skynet conf/debug/config.lua > conf/debug/print.log 2>&1 &
else
	if [ -f "conf/$SERVER/print.log" ]; then
		rm conf/$SERVER/print.log
	fi
	touch conf/$SERVER/print.log
    nohup ./skynet conf/$SERVER/config.lua > conf/$SERVER/print.log 2>&1 &
fi


