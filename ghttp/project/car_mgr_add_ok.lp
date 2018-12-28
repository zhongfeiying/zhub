<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.require("luacom") 
	local lfs = _G.require("lfs") 

	local trace_out = _G.trace_out   
	local string = _G.string   
	local tostring = _G.tostring   
	
	local create_file = _G.create_file   
	local write_file = _G.write_file   
	local unlock_file = _G.unlock_file   
	local close_file = _G.close_file   
	local io = _G.io   
	local loadfile = _G.loadfile   
	
	%>
<html>
	<head>
		<title>添加完成</title>
		<%=base.head %>
	</head>
	<body>
		<%			
			local is_exist = true;
			local file = "C:\\zb\\project_app\\ghttp\\car_db.lua";			
			local fun = loadfile(file);  
			fun();
			
			if(_G.db[car_kind]==nil)then
				is_exist = false;--不存在，可以添加
			else
				is_exist = true;--存在，检查id
			end
			if(is_exist == true)then
		%>
				<div data-role="page">
					<div data-role="content">
						<ul data-role="listview" data-insert="true">
							<li data-role="fieldcontain">
								<h4><%=result %></h4>
							</li>
						</ul>
					</div>

			<h1 align="center">同型号车已存在，请检查！</h1>
			<script> 
				setTimeout("javascript:location.href='car_mgr_add.lp'", 4000); 			
			</script>

		
		<%	
			else
			
				local file = "car_db.lua";			
				local f = io.open(file ,"a");  
				
				-- 记录文件开始位置
				local insert_pos = f:seek("end") --获取文件大小			
				trace_out("file begin pos = "..insert_pos .. "\n");


				lfs.lock(f,"w",insert_pos,1024);
				
				local key = "_G.db[\"" .. car_kind .. "\"]";
				f:write("_G.db[\"" .. car_kind .. "\"]= {};\n" )
				f:write(key.."[\"car_kind\"]= \"" .. car_kind .. "\";\n" )
				f:write(key.."[\"price\"]= \"" .. price .. "\";\n" )
				f:write(key.."[\"all_price\"]= \"" .. all_price .. "\";\n" )
				if(oil==nil)then  oil = ""; end
				f:write(key.."[\"oil\"]= \"" .. oil .. "\";\n" )
				if(factory==nil)then  factory = ""; end		
				f:write(key.."[\"factory\"]= \"" .. factory .. "\";\n" )
				if(class_id==nil)then  class_id = ""; end		
				f:write(key.."[\"class_id\"]= \"" .. class_id .. "\";\n" )
				if(sale_time==nil)then  sale_time = ""; end		
				f:write(key.."[\"sale_time\"]= \"" .. sale_time .. "\";\n" )
				if(engine==nil)then  engine = ""; end		
				f:write(key.."[\"engine\"]= \"" .. engine .. "\";\n" )
				if(gear_case==nil)then  gear_case = ""; end		
				f:write(key.."[\"gear_case\"]= \"" .. gear_case .. "\";\n" )
				if(size==nil)then  size = ""; end		
				f:write(key.."[\"size\"]= \"" .. size .. "\";\n" )
				if(structure==nil)then  structure = ""; end		
				f:write(key.."[\"structure\"]= \"" .. structure .. "\";\n" )
				if(max_speed==nil)then  max_speed = ""; end		
				f:write(key.."[\"max_speed\"]= \"" .. max_speed .. "\";\n" )
				if(weight==nil)then  weight = ""; end		
				f:write(key.."[\"weight\"]= \"" .. weight .. "\";\n" )
				if(oil_size==nil)then  oil_size = ""; end		
				f:write(key.."[\"oil_size\"]= \"" .. oil_size .. "\";\n" )
				
				lfs.unlock(f,beginpos,1024);
				
				f:close()  

				--记录临时初始化数据
				local fhandle_temp = io.open("temp_data_car.lua" ,"w");  
				fhandle_temp:write("info={\n" )
			
				fhandle_temp:write("[\"car_kind\"]= \"" .. car_kind .. "\";\n" )
				fhandle_temp:write("[\"price\"]= \"" .. price .. "\";\n" )
				fhandle_temp:write("[\"all_price\"]= \"" .. all_price .. "\";\n" )
				if(oil==nil)then  oil = ""; end
				fhandle_temp:write("[\"oil\"]= \"" .. oil .. "\";\n" )
				if(factory==nil)then  factory = ""; end		
				fhandle_temp:write("[\"factory\"]= \"" .. factory .. "\";\n" )
				if(class_id==nil)then  class_id = ""; end		
				fhandle_temp:write("[\"class_id\"]= \"" .. class_id .. "\";\n" )
				if(sale_time==nil)then  sale_time = ""; end		
				fhandle_temp:write("[\"sale_time\"]= \"" .. sale_time .. "\";\n" )
				if(engine==nil)then  engine = ""; end		
				fhandle_temp:write("[\"engine\"]= \"" .. engine .. "\";\n" )
				if(gear_case==nil)then  gear_case = ""; end		
				fhandle_temp:write("[\"gear_case\"]= \"" .. gear_case .. "\";\n" )
				if(size==nil)then  size = ""; end		
				fhandle_temp:write("[\"size\"]= \"" .. size .. "\";\n" )
				if(structure==nil)then  structure = ""; end		
				fhandle_temp:write("[\"structure\"]= \"" .. structure .. "\";\n" )
				if(max_speed==nil)then  max_speed = ""; end		
				fhandle_temp:write("[\"max_speed\"]= \"" .. max_speed .. "\";\n" )
				if(weight==nil)then  weight = ""; end		
				fhandle_temp:write("[\"weight\"]= \"" .. weight .. "\";\n" )
				if(oil_size==nil)then  oil_size = ""; end		
				fhandle_temp:write("[\"oil_size\"]= \"" .. oil_size .. "\";\n" )
				fhandle_temp:write("};\n" )
				
			
				fhandle_temp:close();	
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
						setTimeout("javascript:location.href='car_mgr_add.lp'", 4000); 			
					</script>
		<%
			end

		%>
				
			<%=base.footer_main() %>
		</div>
	</body>
</html>
