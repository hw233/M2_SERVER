root = "./"
luaservice = root.."service/?.lua;"..root.."service/?/init.lua;"..root.."service_center/?.lua;"..root.."service_center/?/init.lua"
lualoader = root .. "lualib/loader.lua"
lua_path = root.."lualib/?.lua;"..root.."lualib/?/init.lua;"..root.."service_center/?.lua"
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

-- 获取系统的环境变量
local function getEnviroment(name)
    local format = string.format('echo -e $%s | tr -d "\n"',name)
    local value = io.popen(format,'r'):read('*a')
    return value
end


center_mysql = getEnviroment("CENTER_MYSQL")
server_id = getEnviroment("SERVER_ID")
port = getEnviroment("GAME_PORT")
console_port = port + 1