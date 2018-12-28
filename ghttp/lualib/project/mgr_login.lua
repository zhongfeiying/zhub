local modename = ...
local M = {}
_G[modename] = M
package.loaded[modename] = M

--------------------------------
local string = string
local tostring = tostring
local dofile = dofile
local trace_out = trace_out
local mgr_session = require("project.mgr_session")
---------------------------------
_ENV = M
--**-1表示用户名不存在，-2表示密码错误,1表示登录正确
function check_user(user,passwd)
	--dofile("project\\user_list.lua");	
	local users={
		["admin"] = {pwd="123";},
		["ad"] = {pwd="123";},
	};
	if(users[user] == nil) then return -1 end --用户不存在	
	if(users[user].pwd ~= passwd)then return -2 end --密码错误
	return true;
end


