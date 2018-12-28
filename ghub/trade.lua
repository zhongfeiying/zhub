local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M

local mkdir = mkdir
local loadfile = loadfile
local pairs = pairs
local os = os
local comma = require("comma")
local trace_out = trace_out
_ENV = M 

local trade_dir = "trade"
mkdir(trade_dir)
local trade_name = trade_dir .. "\\" .. "trades.lua"

trades = {}

function refesh_trade()
 local func = loadfile(trade_name,"bt",M)
 if func then
	 func()
 end
end

refesh_trade()

function save()
	comma.save_file(trade_name,trades,"trades")
end

function get_trades_str(buyer)
	local rs = {}
	for k,v in pairs(trades) do
		if v.buyer == buyer then
			rs[k] = v
		end
	end
	local str = comma.save_str(rs,"trades") 
	return str
end

function add_trade(softname,buyer,months,buyid,expire)
	trades[buyid] = {}
	trades[buyid].softname = softname
	trades[buyid].buyer = buyer 
	trades[buyid].months = months 
	trades[buyid].date = os.time()
	trades[buyid].expire = expire
	save()
end
