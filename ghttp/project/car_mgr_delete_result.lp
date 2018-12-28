<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_policy_db"] = nil 
	local mgr_policy_db = _G.require("project.mgr_policy_db") 

	_G.require("luaext") 
	
	
	local table = _G.table   
	local tostring = _G.tostring   
	local trace_out = _G.trace_out   
	local loadfile = _G.loadfile   
	
	%>
<html>
	<head>
		<title>搜索到的保单</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
		<%
			local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";			
			trace_out("dofile = " ..file.. "\n");
			local fun = loadfile(file);  
			fun();
			
			trace_out("car_id = " .. car_id .. "\n");
			local item = {};
			if(_G.db[tostring(car_id)] ~= nil)then
				item = _G.db[car_id];		
				_G.db[car_id]=nil;
				mgr_policy_db.save_file(_G.db);
		%>	
			<h1 align="center">删除完成。</h1>
			<script> 
				setTimeout("javascript:location.href='policy_delete.lp'", 4000); 			
			</script>
		<%
			else			
		%>
			<h1 align="center">保单没有查到，请重新输入车辆识别码(车架号)。</h1>
			<script> 
				setTimeout("javascript:location.href='policy_delete.lp'", 4000); 				
			</script>
		<%
			end			
		%>		
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
