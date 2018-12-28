local modename = ...
local M = {}
_G[modename] = M
package.loaded[modename] = M

--------------------------------
local string = string
local tostring = tostring
local dofile = dofile
local pairs = pairs
local trace_out = trace_out
local io = _G.io   
local loadfile = _G.loadfile   

---------------------------------
_ENV = M
--**把table保存文件
function save_file(db)
	local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";

	local f = io.open(file ,"w");  
	f:write("_G.db = {};\n" )
	
	for k,v in pairs(db) do
		local key = "_G.db[\"" .. v.car_id .. "\"]";
		f:write(key .. " = {};\n" )
		if(v.car_id==nil)then  v.car_id = "ERROR"; end		
		f:write(key.."[\"car_id\"]= \"" .. v.car_id .. "\";\n" )
		if(v.engine_id==nil)then  v.engine_id = "ERROR_engine_id"; end		
		f:write(key.."[\"engine_id\"]= \"" .. v.engine_id .. "\";\n" )
		if(v.name==nil)then  v.name = "NO"; end		
		f:write(key.."[\"name\"]= \"" .. v.name .. "\";\n" )
		if(v.id==nil)then  v.id = "ERROR"; end		
		f:write(key.."[\"id\"]= \"" .. v.id .. "\";\n" )
		if(v.company_id==nil)then  v.company_id = ""; end		
		f:write(key.."[\"company_id\"]= \"" .. v.company_id .. "\";\n" )
		if(v.brand==nil)then  v.brand = ""; end		
		f:write(key.."[\"brand\"]= \"" .. v.brand .. "\";\n" )
		if(v.color==nil)then  v.color = ""; end		
		f:write(key.."[\"color\"]= \"" .. v.color .. "\";\n" )
		if(v.phone==nil)then  v.phone = ""; end		
		f:write(key.."[\"phone\"]= \"" .. v.phone .. "\";\n" )
		if(v.address==nil)then  v.address = ""; end		
		f:write(key.."[\"address\"]= \"" .. v.address .. "\";\n" )
		if(v.sale_address==nil)then  v.sale_address = ""; end		
		f:write(key.."[\"sale_address\"]= \"" .. v.sale_address .. "\";\n" )
		if(v.factory==nil)then  v.factory = ""; end		
		f:write(key.."[\"factory\"]= \"" .. v.factory .. "\";\n" )
		if(v.price==nil)then  v.price = ""; end		
		f:write(key.."[\"price\"]= \"" .. v.price .. "\";\n" )
		if(v.kind==nil)then  v.kind = ""; end		
		f:write(key.."[\"kind\"]= \"" .. v.kind .. "\";\n" )
		if(v.use_prop==nil)then  v.use_prop = ""; end		
		f:write(key.."[\"use_prop\"]= \"" .. v.use_prop .. "\";\n" )
		if(v.data_start==nil)then  v.data_start = ""; end		
		f:write(key.."[\"data_start\"]= \"" .. v.data_start .. "\";\n" )
		if(v.time==nil)then  v.time = ""; end		
		f:write(key.."[\"time\"]= \"" .. v.time .. "\";\n" )
		if(v.data_confim==nil)then  v.data_confim = ""; end		
		f:write(key.."[\"data_confim\"]= \"" .. v.data_confim .. "\";\n" )
		if(v.saleman==nil)then  v.saleman = ""; end		
		f:write(key.."[\"saleman\"]= \"" .. v.saleman .. "\";\n" )
	
--[[	
		f:write(key .. " = {};\n" )
		f:write(key.."['car_id']= '" .. v.car_id .. "';\n" )
		f:write(key.."['engine_id']= '" .. v.engine_id .. "';\n" )
		f:write(key.."['name']= '" .. v.name .. "';\n" )
		f:write(key.."['id']= '" .. v.id .. "';\n" )
		f:write(key.."['company_id']= '" .. v.company_id .. "';\n" )
		f:write(key.."['brand']= '" .. v.brand .. "';\n" )
		f:write(key.."['color']= '" .. v.color .. "';\n" )
		f:write(key.."['phone']= '" .. v.phone .. "';\n" )
		f:write(key.."['address']= '" .. v.address .. "';\n" )
		f:write(key.."['sale_address']= '" .. v.sale_address .. "';\n" )
		f:write(key.."['factory']= '" .. v.factory .. "';\n" )
		f:write(key.."['price']= '" .. v.price .. "';\n" )
		f:write(key.."['kind']= '" .. v.kind .. "';\n" )
		f:write(key.."['use_prop']= '" .. v.use_prop .. "';\n" )
		f:write(key.."['data_start']= '" .. v.data_start .. "';\n" )
		f:write(key.."['time']= '" .. v.time .. "';\n" )
		f:write(key.."['data_confim']= '" .. v.data_confim .. "';\n" )
		f:write(key.."['saleman']= '" .. v.saleman .. "';\n" )
	
--]]	
	end	
	
	f:close()  

	
	
end

function check_car_id(new_id)
	local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";			
	local fun = loadfile(file);  
	fun();
	
	if(db[new_id]==nil)then
		return false;--不存在，可以添加
	else
		return true;--存在，检查id
	end

end





