local skynet = require "skynet"
local netpack = require "skynet.netpack"
local socket = require "skynet.socket"
local crypt = require "skynet.crypt"
local pbc = require "protobuf"
local cluster = require "skynet.cluster"
local redis_manager = require "redis_manager"
local cjson = require "cjson"
local constant = require "constant"
local PUSH_EVENT = constant["PUSH_EVENT"]

local Map = require "Map"

local user_info = {}
local property = {}

function user_info:init(info)
	self.fd = info.fd
	self.secret = info.secret
    self.user_ip = info.ip
    self.user_info_key = "info:"..info.user_id
    self.session_id = 0
    self.node_name = skynet.getenv("node_name")
    self.service_id = skynet.self()
    
    property.user_id = info.user_id
    property.user_name = info.user_name
    property.user_pic = info.user_pic
    --初始化金币数量为0
    property.gold_num = 0
    
    local center_redis = redis_manager:connectCenterRedis()
    property = Map.new(center_redis,self.user_info_key,property)
    self.center_redis = center_redis
    --登陆成功之后,推送玩家信息
    local data = {}
    data.user_id = info.user_id
    data.user_name = info.user_name
    data.user_pic = info.user_pic
    data.user_ip = info.ip
    data.gold_num = property.gold_num

    self:send({[PUSH_EVENT.PUSH_USER_INFO] = data})
end

function user_info:clear()
	property = {}
end

--更新用户属性
function user_info:set(key,value)
    property[key] = value
end

--获取用户属性
function user_info:get(key)
    return property[key]
end

--获取多项属性
function user_info:getValues(...)
    local values = {}
    local args = {...}
    for _,key in ipairs(args) do
        values[key] = self:get(key)
    end
    return values
end

--获取用户当前已经存在的room_id
function user_info:getCurrentRoomId()
    return self:get("room_id")
end

--获取center服的结点
function user_info:getCenterNode()
    local result,center_node = pcall(cluster.call,"common_server", ".cluster_manager", "pickNode", "center_server")
    if not result then
        print("ERROR: can't find center_node")
        return 
    end
    return center_node
end

function user_info:safeClusterCall(node_name,service_name,func,...)
    return pcall(cluster.call,node_name,service_name,func,...)
end

function user_info:send(data_content)
    print("S2C->",cjson.encode(data_content))
    -- 转换为protobuf编码
    local success, data, err = pcall(pbc.encode, "S2C", data_content)
    if not success or err then
        print("encode protobuf error")
        return
    end

    -- 根据密钥进行加密
    if data and self.secret then
        success, data = pcall(crypt.desencode, self.secret, data)
        if not success then
            print("desencode error")
            return
        end
    end

    -- 拼接包长后发送
    socket.write(self.fd, string.pack(">s2", crypt.base64encode(data)))
end

function user_info:getTargetNodeByRoomId(room_id)
    local center_node = self.center_redis:hget("room_list",room_id)
    return center_node
end









function user_info:leaveRoom()
    local room_id = user_info:hgetData(user_info.user_info_key,"room_id")
    local user_id = self.user_id
    local center_node = self:getTargetNodeByRoomId(room_id)
    if not center_node then
        return true
    end
    local result = cluster.call(center_node,".room_manager","leaveRoom",room_id,user_id)
    --清理绑定的room_id
    print("FYD  清理")
    self:hdelData(self.user_info_key,"room_id",room_id)
    return result
end



function user_info:setData(key,value)
    local center_redis = self:getRedis()
    center_redis:set(key,value)
    center_redis:disconnect()
end

function user_info:hdelData(key1,key2)
    local center_redis = self:getRedis()
    center_redis:hdel(key1,key2)  
    center_redis:disconnect()
end

function user_info:hsetData(key1,key2,value)
    local center_redis = self:getRedis()
    print("key1,key2,value --->",key1,key2,value)
    center_redis:hset(key1,key2,value)  
    center_redis:disconnect()
end

function user_info:hgetData(key1,key2)
    local center_redis = self:getRedis()
    local data = center_redis:hget(key1,key2)
    center_redis:disconnect()
    return data
end


function user_info:getRedis()
    return redis_manager:connectCenterRedis()
end

return user_info