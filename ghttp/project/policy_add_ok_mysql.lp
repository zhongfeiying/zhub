<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_policy_db"] = nil 
	local mgr_policy_db = _G.require("project.mgr_policy_db") 
	

	_G.require("luacom") 
	local lfs = _G.require("lfs") 

	local trace_out = _G.trace_out   
	local string = _G.string   
	local tostring = _G.tostring   
	
	local create_file = _G.create_file   
	local lock_file = _G.lock_file   
	local write_file = _G.write_file   
	local unlock_file = _G.unlock_file   
	local close_file = _G.close_file   
	local io = _G.io   
	
	%>
<html>
	<head>
		<title>添加完成</title>
		<%=base.head %>
	</head>
	<body>
		<%
			trace_out("car_id = " ..car_id.. "\n");
			trace_out("engine_id = " .. engine_id .. "\n");		
			
			
			
			local is_exist = mgr_policy_db.check_car_id(car_id);
			if(is_exist == false)then
							
			end
			
			
			local file = "policy_db.lua";			
			local f = io.open(file ,"a");  
			
			-- 记录文件开始位置
			local insert_pos = f:seek("end") --获取文件大小			
			trace_out("file begin pos = "..insert_pos .. "\n");


			lfs.lock(f,"w",insert_pos,1024);
			
			local key = "db[\"" .. car_id .. "\"]";
			f:write("db[\"" .. car_id .. "\"]= {};\n" )
			f:write(key.."[\"car_id\"]= \"" .. car_id .. "\";\n" )
			f:write(key.."[\"engine_id\"]= \"" .. engine_id .. "\";\n" )
			f:write(key.."[\"name\"]= \"" .. name .. "\";\n" )
			if(id==nil)then  id = ""; end
			f:write(key.."[\"id\"]= \"" .. id .. "\";\n" )
			if(company_id==nil)then  company_id = ""; end		
			f:write(key.."[\"company_id\"]= \"" .. company_id .. "\";\n" )
			if(brand==nil)then  brand = ""; end		
			f:write(key.."[\"brand\"]= \"" .. brand .. "\";\n" )
			if(color==nil)then  color = ""; end		
			f:write(key.."[\"color\"]= \"" .. color .. "\";\n" )
			if(phone==nil)then  phone = ""; end		
			f:write(key.."[\"phone\"]= \"" .. phone .. "\";\n" )
			if(address==nil)then  address = ""; end		
			f:write(key.."[\"address\"]= \"" .. address .. "\";\n" )
			if(sale_address==nil)then  sale_address = ""; end		
			f:write(key.."[\"sale_address\"]= \"" .. sale_address .. "\";\n" )
			if(factory==nil)then  factory = ""; end		
			f:write(key.."[\"factory\"]= \"" .. factory .. "\";\n" )
			if(price==nil)then  price = ""; end		
			f:write(key.."[\"price\"]= \"" .. price .. "\";\n" )
			if(kind==nil)then  kind = ""; end		
			f:write(key.."[\"kind\"]= \"" .. kind .. "\";\n" )
			if(use_prop==nil)then  use_prop = ""; end		
			f:write(key.."[\"use_prop\"]= \"" .. use_prop .. "\";\n" )
			if(data_start==nil)then  data_start = ""; end		
			f:write(key.."[\"data_start\"]= \"" .. data_start .. "\";\n" )
			if(time==nil)then  time = ""; end		
			f:write(key.."[\"time\"]= \"" .. time .. "\";\n" )
			if(data_confim==nil)then  data_confim = ""; end		
			f:write(key.."[\"data_confim\"]= \"" .. data_confim .. "\";\n" )
			if(saleman==nil)then  saleman = ""; end		
			f:write(key.."[\"saleman\"]= \"" .. saleman .. "\";\n" )
			
			lfs.unlock(f,beginpos,1024);
			
			f:close()  

			--记录临时初始化数据
			local fhandle_temp = io.open("temp_data.lua" ,"w");  
			fhandle_temp:write("info={\n" )
		
			fhandle_temp:write("[\"car_id\"]= \"" .. car_id .. "\";\n" )
			fhandle_temp:write("[\"engine_id\"]= \"" .. engine_id .. "\";\n" )
			fhandle_temp:write("[\"name\"]= \"" .. name .. "\";\n" )
			if(id==nil)then  id = ""; end
			fhandle_temp:write("[\"id\"]= \"" .. id .. "\";\n" )
			if(company_id==nil)then  company_id = ""; end		
			fhandle_temp:write("[\"company_id\"]= \"" .. company_id .. "\";\n" )
			if(brand==nil)then  brand = ""; end		
			fhandle_temp:write("[\"brand\"]= \"" .. brand .. "\";\n" )
			if(color==nil)then  color = ""; end		
			fhandle_temp:write("[\"color\"]= \"" .. color .. "\";\n" )
			if(phone==nil)then  phone = ""; end		
			fhandle_temp:write("[\"phone\"]= \"" .. phone .. "\";\n" )
			if(address==nil)then  address = ""; end		
			fhandle_temp:write("[\"address\"]= \"" .. address .. "\";\n" )
			if(sale_address==nil)then  sale_address = ""; end		
			fhandle_temp:write("[\"sale_address\"]= \"" .. sale_address .. "\";\n" )
			if(factory==nil)then  factory = ""; end		
			fhandle_temp:write("[\"factory\"]= \"" .. factory .. "\";\n" )
			if(price==nil)then  price = ""; end		
			fhandle_temp:write("[\"price\"]= \"" .. price .. "\";\n" )
			if(kind==nil)then  kind = ""; end		
			fhandle_temp:write("[\"kind\"]= \"" .. kind .. "\";\n" )
			if(use_prop==nil)then  use_prop = ""; end		
			fhandle_temp:write("[\"use_prop\"]= \"" .. use_prop .. "\";\n" )
			if(data_start==nil)then  data_start = ""; end		
			fhandle_temp:write("[\"data_start\"]= \"" .. data_start .. "\";\n" )
			if(time==nil)then  time = ""; end		
			fhandle_temp:write("[\"time\"]= \"" .. time .. "\";\n" )
			if(data_confim==nil)then  data_confim = ""; end		
			fhandle_temp:write("[\"data_confim\"]= \"" .. data_confim .. "\";\n" )
			if(saleman==nil)then  saleman = ""; end		
			fhandle_temp:write("[\"saleman\"]= \"" .. saleman .. "\";\n" )			
			fhandle_temp:write("};\n" )
			
		
			fhandle_temp:close();	
		%>
		<%
		--[[
		
			
		local connect_str = "Driver={MySQL ODBC 5.3 ANSI Driver};Server=localhost;Port=3306;Database=world;uid=root;pwd=1234";
		local connection = _G.luacom.CreateObject("ADODB.Connection");

		connection.ConnectionString = connect_str;
		connection:Open();
		
		local recordset = _G.luacom.CreateObject("ADODB.RecordSet");
		local str = "select * from city";
		recordset:Open(str, connection);

		
		local row = {}
		local fields = recordset.Fields
		local i = 0
		 
		while i < fields.Count do
		local field = fields:Item(i)
			trace_out("field.Name = " ..tostring(field.Name).. "\n");
			trace_out("field.Value = " ..tostring(field.Value).. "\n");
			--row[i] = field.Value
			--row[field.Name] = field.Value
		i = i + 1
		end
		 
		recordset:MoveNext()

		 local result = ""
		 if car_id and engine_id and name and id then

		 else
			result = "please input username password email phone "
		 end
		 --]]
		%>
		<div data-role="page">
			<div data-role="content">
				<ul data-role="listview" data-insert="true">
					<li data-role="fieldcontain">
						<h4><%=result %></h4>
					</li>
				</ul>
			</div>
			
			<h1 align="center">添加完成。请继续添加</h1>
			<script> 
				setTimeout("javascript:location.href='policy_add.lp'", 4000); 			
			</script>
			
			<%=base.footer_main() %>
		</div>
	</body>
</html>
