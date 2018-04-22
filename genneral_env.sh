#!/bin/bash

SERVER_ID=$1
if [ ! -n "$SERVER_ID" ]; then
	echo "SERVER_ID MUST BE SPACILA"
	exit 1
fi

# 检测文件夹是否存在,如果不存在则创建
if [ ! -d "conf/$SERVER_ID/" ]; then
	echo "111"
    mkdir conf/$SERVER_ID
fi

if [ -f "conf/$SERVER_ID/relase.env" ]; then
	rm conf/$SERVER_ID/relase.env
fi

# 创建环境变量文件
touch conf/$SERVER_ID/relase.env

# 需要配置正式环境下的mysql地址
RELASE_MYSQL="127.0.0.1:3306"

echo "CENTER_MYSQL=\"$RELASE_MYSQL\"" >> conf/$SERVER_ID/relase.env

echo "SERVER_ID=$SERVER_ID" >> conf/$SERVER_ID/relase.env

# 游戏端口号 = serverid + 8000
# 控制台端口号
GAME_PORT=$(($SERVER_ID + 8000))
echo "GAME_PORT=$GAME_PORT" >> conf/$SERVER_ID/relase.env

CONSOLE_PORT=$(($SERVER_ID + 9000))
echo "CONSOLE_PORT=$CONSOLE_PORT" >> conf/$SERVER_ID/relase.env