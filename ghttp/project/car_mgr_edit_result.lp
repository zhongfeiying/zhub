<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_policy_db"] = nil 
	local mgr_policy_db = _G.require("project.mgr_policy_db") 
	
	local table = _G.table   
	local tostring = _G.tostring   
	local trace_out = _G.trace_out   
	local loadfile = _G.loadfile   
	_G.require("luaext") 
	
	%>
<html>
	<head>
		<title>完成修改保单</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>			
		<%
			local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";			
			local fun = loadfile(file);  
			fun();
			
			local item = {};
			if(_G.db[tostring(car_id)] ~= nil)then
				_G.db[car_id].car_id = car_id;
				_G.db[car_id].engine_id = engine_id;
				_G.db[car_id].name = name;
				_G.db[car_id].id = id;
				_G.db[car_id].company_id = company_id;
				_G.db[car_id].brand = brand;
				_G.db[car_id].color = color;
				_G.db[car_id].phone = phone;
				_G.db[car_id].address = address;
				_G.db[car_id].sale_factory = sale_factory;
				_G.db[car_id].sale_address = sale_address;
				_G.db[car_id].factory = factory;
				_G.db[car_id].price = price;
				_G.db[car_id].kind = kind;
				_G.db[car_id].use_prop = use_prop;
				_G.db[car_id].data_start = data_start;
				_G.db[car_id].time = time;
				_G.db[car_id].data_confim = data_confim;
				_G.db[car_id].saleman = saleman;
				mgr_policy_db.save_file(_G.db);
				
			end
		%>	
	
			<h1 align="center">修改完成。</h1>
			<script> 
				setTimeout("javascript:location.href='policy_edit.lp'", 4000); 			
			</script>
	
	
		
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
