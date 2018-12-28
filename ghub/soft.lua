local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M

local mkdir = mkdir
local loadfile = loadfile
local comma = require("comma")
local os = os
local trace_out = trace_out
_ENV = M

local soft_dir = "softs"
local soft_filename = soft_dir .. "\\softs.lua"

function refresh()
	local func = loadfile(soft_filename,"bt",M)
	if (func) then
		func()
	end
end


mkdir(soft_dir)
softs = {}
refresh()

function save()
	comma.save_file(soft_filename,softs,"softs")
end

function refesh_soft(softname)
   local id = softs[softname].gid	
	 local t = {} 
	 t.auth={}
	 local func = loadfile( soft_dir .. "\\" .. id ,"bt",t)
	 if(func) then
		 func()
	 end
	 return t.auth 
end

function save_soft(softname,auth)
   local id = softs[softname].gid	
	 comma.save_file(soft_dir .. "\\" .. id,auth,"auth")
end

function get_prices(softname,months)
	if not softs[softname] then return nil end
	return softs[softname].price * months
end

function auth_soft(softname,usrname)
	if not softs[softname] then
		return false
	end
  local id = softs[softname].gid
  local m = refesh_soft(softname)
	if not m[usrname] then return false end
	if os.time() > m[usrname].expire then return false end
	return true
end

function buy_soft(softname,buyer,months,buyid)
	if not softs[softname] then
		return false
	end
	local m = refesh_soft(softname)
	m[buyid] = {}
	m[buyid].buyer = buyer
	m[buyid].months = months
	local curdate = os.time()
	m[buyid].buydate = curdate
	m[buyer] = m[buyer] or {}

	if m[buyer].expire and curdate < m[buyer].expire then
		m[buyer].expire = m[buyer].expire + 60*60*24*30*months
	else
		m[buyer].expire = curdate + 60*60*24*30*months
	end
	save_soft(softname,m)	

	return true,m[buyer].expire 
end

function get_owner(name)
	return softs[name].usrname
end

function add_soft(name,gid,usrname,price)
	if softs[name] then
		return false
	end
	softs[name] = {}
	softs[name].gid = gid
	softs[name].usrname = usrname
	softs[name].price = price
	save()
	return true
end

function get_softs_str()
	local str = comma.save_str(softs,"softs")
	return str
end

function get_soft(name)
	return softs[name]	
end
