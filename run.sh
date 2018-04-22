SERVER=$1
MODE=$2
#检查启动参数
if [ ! -n "$SERVER" ]; then
    echo "[ERROR] NO SERVER TYPE!"
    exit 1
fi
#检查启动参数，如果没有配置启动参数，则设置为release模式
if [ ! -n "$MODE" ]; then
    MODE = "release"
fi

touch conf/$SERVER/print.log

ulimit -n 65535
ulimit -c unlimited

# 如果是debug模式
if [ "$(MODE) == debug"]; then
    ./skynet conf/$SERVER/config.lua
elif
    nohup ./skynet conf/$SERVER/config.lua > conf/$SERVER/print.log 2>&1 &
fi


