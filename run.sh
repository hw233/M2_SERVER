#!/bin/bash

ulimit -n 65535
ulimit -c unlimited

# 如果是debug模式
if [ "$(MODE) == 'DEBUG'"]; then
	rm conf/debug/print.log
	touch conf/debug/print.log
    nohup ./skynet conf/debug/config.lua > conf/debug/print.log 2>&1 &
else
	rm conf/$SERVER/print.log
	touch conf/$SERVER/print.log
    nohup ./skynet conf/$SERVER/config.lua > conf/$SERVER/print.log 2>&1 &
fi


