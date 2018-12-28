local modename = ...
local M = {}
_G[modename] = M
package.loaded[modename] = M

--------------------------------
local comma = require("comma")
local luaext = require("luaext")
local loadfile = loadfile
local load = load
local string = string
local tonumber = tonumber
local pairs = pairs
local tostring = tostring
local trace_out = trace_out
local socket = socket
---------------------------------
_ENV = M

local session_dir = "project/session/"

function session_db(id)
	local t = {}
	t.db = {}
	local func = loadfile(session_dir .. id,"bt",t)
	if func then func() end
	t.db[id] = t.db[id] or nil
	return t.db[id]
end
function session_get(id,k)
	local t = {}
	t.db = {}
	local func = loadfile(session_dir .. id,"bt",t)
	if func then func() end
	t.db[id] = t.db[id] or nil
	return t.db[id][k]	
end

function session_save(id,k,v)
	local t = {}
	t.db = {}
	local func = loadfile(session_dir .. id,"bt",t)
	if func then func() end
	t.db[id] = t.db[id] or {}
	t.db[id][k] = v
	comma.save_file(session_dir .. id,t.db,"db")
end

function sessionid()
	return luaext.guid()
end

function recv_str(content)
	local num = tonumber(content:receive())
	local str = content:receive(num)
	return str
end

function farse_recv(content,t)
	local num = tonumber(content:receive())
	local str = content:receive(num)
	local func = load(str ,"rcv","bt",t)
	if func then func() end
end

function send_str(content,str)
	local prefix = string.len(str) .. "\r\n" .. str
	content:send(prefix)
end
