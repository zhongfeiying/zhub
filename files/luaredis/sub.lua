local luaredis = require "luaredis"
local chat

local function onmessage(result)
for k,v in pairs(result) do
if(trace_out) then 
trace_out("k = " .. k .. "v = " .. v .. "\n")
else
print("k = " .. k .. "v = " .. v)
end
end
end

local mess_fuc = onmessage

local function processmessage()
while true do
local result = {}
recv_redis(chat,result)
if(result["*"] and result[result["*"]]=="quit") then break end
mess_func(result)
end
chat:close()
end

local recv_fun = {}

recv_fun['+'] = function (msg,redis,result)
local value = string.match(msg,"%+(.*)\r\n")
result["+"] = value
end

recv_fun["-"] = function (msg,redis,result)
local value = string.match(msg,"%-(.*)\r\n")
result["-"] = value
end

recv_fun[":"] = function (msg,redis,result)
local value = string.match(msg,":(.*)\r\n")
table.insert(result,value)
end

recv_fun["*"] = function (msg,redis,result)
local value = string.match(msg,"%*(.*)\r\n")
value = tonumber(value)
result["*"] = value
for i = 1,value do
recv_redis(redis,result)
end
end

recv_fun["$"] = function (msg,redis,result)
local value = string.match(msg,"%$(.*)\r\n")
local v = tonumber(value) + 2
local s = redis:getline(255)
while string.len(s) < v do
s = s .. redis:getline(255)
end
table.insert(result,string.sub(s,1,-3))
end

function recv_redis(redis,result)
result = result or {}
local line = redis:getline(255)
recv_fun[string.sub(line,1,1)](line,redis,result)
end

--[[
local function test_recv_fun()
local data = { "+OK\r\n","-ERROR bad command\r\n",":1\r\n","$6\r\n","*5\r\n"}
for i,v in ipairs(data) do
local flag = string.sub(v,1,1)
--if(recv_fun[flag]) then print(flag) end
local value = recv_fun[string.sub(v,1,1)](v)
--if value then print(value) end
print("string = " .. v .. "------------   value = " .. value )
end
end
--]]

function format_redis_cmd(...)
local num = select('#',...)
local cmd = string.format("*%d\r\n",num)
for i,v in ipairs{...} do
cmd = cmd .. string.format("$%d\r\n%s\r\n",string.len(v),v)
end
return cmd
end

function publish(usrname,prjname,recvname,msg)
local redis = luaredis.new("www.apcad.com",6379)
local chanle = usrname .. "." .. prjname .. "." .. recvname
local cmd = format_redis_cmd("publish",chanle,msg)
redis:apcmd(cmd)
local result = {}
recv_redis(redis,result)
redis:close()
end

function setpsubscribe(usrname,prjname,func)
chat = luaredis.new("www.apcad.com",6379)
if not chat then return end
local chanle = usrname .. "." .. prjname .. ".*"
local cmd = format_redis_cmd("psubscribe",chanle)
chat:apcmd(cmd)
mess_func = func
processmessage()
end

--publish("ge","prj1","zgb","hello world")
setpsubscribe("ge","prj1",onmessage)
--test_recv_fun()
