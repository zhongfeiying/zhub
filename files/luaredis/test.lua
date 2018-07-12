local luaredis = require "luaredis"
local redis = luaredis.new("www.apcad.com",6379)
flag = redis:hset("ge","item","test")
value,flag = redis:hget("ge","item")
print(value)
redis:close()
--[[
local redis = luaredis.new("www.qqft.com",50001)
logined = false
dofile("login.lua")
redis:apcmd("login " .. name .. " " .. pass .. "\n")
local line = redis:getline(255)
if string.match(line,"^login ok") then logined = true end
redis:close()
--]]
--[[
local function process_cmd(line)
redis:apcmd(line .. "\n")
while true do
local result = redis:getline(255)
io.write(result)
io.flush()
if(string.match(result,"^%$%c?$")) then break end
end
end

local function main()
for count = 1, math.huge do
local line = io.read()
if string.match(line,"^%$%c?$") then break end
process_cmd(line)
end
end
main()
--]]
--[[
if(redis) then
str = redis:apcmd("pwd\n")
str = redis:getline(255)
print(str)
str = redis:getline(255)
print(str)
redis:close()
end
--]]
--[[
if(redis) then 
--print(redis:info())
--str,flag = redis:hget("ap:1","node:181")
--print(str)
str = redis.aphelp()
print(str)
str = redis.apquit()
print(str)
redis:close()
end
--]]
