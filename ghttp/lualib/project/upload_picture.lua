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



function upload_picture(file_data)
	
	trace_out("data = " .. tostring(file_data));
end
