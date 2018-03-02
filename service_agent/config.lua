root = "./"
luaservice = root.."service/?.lua;"..root.."service_agent/?.lua;"..root.."service_agent/?/init.lua"
lualoader = root .. "lualib/loader.lua"
lua_path = root.."lualib/?.lua;"..root.."lualib/?/init.lua;"..root.."service_agent/?.lua"
lua_cpath = root .. "luaclib/?.so"
snax = root.."test/?.lua"
cpath = root.."cservice/?.so"

thread = 8
harbor = 0

logger = "logger"
logservice = "snlua"
logpath = "."

start = "main"

protobuf = root.."proto/protocol.pb"
center_redis = "127.0.0.1:6379"

center_mysql = "127.0.0.1:3306"

mode = "debug"
--cluster


node_type = "agent_server"
node_name = "agent_01"
node_address = "127.0.0.1:10001"

cluster = "./lualib/cluster_config.lua"