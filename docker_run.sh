#!/bin/bash

INMAGE_ID=$1
SERVER_ID=$2
MODE=$3
if [ ! -n "$INMAGE_ID" ]; then
	echo "INMAGE_ID MUST BE SPACILA"
	exit 1
fi

if [ ! -n "$SERVER_ID" ]; then
	echo "SERVER_ID MUST BE SPACILA"
	exit 1
fi
if [ ! -n "$MODE" ]; then
	MODE="release"
fi

GAME_PORT=$(($SERVER_ID + 8000))
CONSOLE_PORT=$(($SERVER_ID + 9000))

if [ "$MODE == 'debug'" ]; then
	docker run -p 8888:8888 -p 9999:9999 --env-file ./conf/debug/debug.env -dit $INMAGE_ID /bin/bash
else
	docker run -p $GAME_PORT:$GAME_PORT -p $CONSOLE_PORT:$CONSOLE_PORT --env-file ./conf/$SERVER_ID/relase.env -d $INMAGE_ID /bin/bash
fi