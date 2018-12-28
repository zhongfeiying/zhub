require "global"
require "comma"
local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M

------------------------------------------
local usr = usr
local cmds = cmds
local link = link
local send_str = send_str
local trace_out = trace_out
local save_file = comma.save_file
-------------------------------------------
_ENV = M

function get_balance(usrname)
	if usr[usrname] then
		usr[usrname].balance = usr[usrname].balance or 0.0
		return usr[usrname].balance
	else
		return nil 
	end
end

function deposit(usrname,num)
	if usr[usrname] then
		usr[usrname].balance = usr[usrname].balance or 0.0
		usr[usrname].balance = usr[usrname].balance + num
		save_file("passwd",usr,"usr")
		return true
	else
		return false
	end
end

function withdraw(usrname,num)
	if usr[usrname] then
		usr[usrname].balance = usr[usrname].balance or 0.0
	else
		return false
	end
	if usr[usrname].balance >= num then
		usr[usrname].balance = usr[usrname].balance - num
		save_file("passwd",usr,"usr")
		return true
	else
		return false
	end
end
