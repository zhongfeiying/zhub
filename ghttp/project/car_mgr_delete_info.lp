<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	local table = _G.table   
	local tostring = _G.tostring   
	local trace_out = _G.trace_out   
	local loadfile = _G.loadfile   
	local pairs = _G.pairs   
	local utf8 = _G.utf8   
	_G.require("luaext") 
	
	%>
<html>
	<head>
		<title>搜索到的车型</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
			
			
			<form action="car_mgr_delete_result.lp" method="post">
				<ul data-role="listview" data-insert="true">
					<li data-role="fieldcontain">
						<label for="car_kind">车辆识别码:</label>
							<input type = "text" name = "car_kind" id="car_kind" value = <%=car_kind%> required="required">
					</li>
				</ul
				<li data-role="fieldcontain">
					<input type = "submit" value = "删除信息" data-theme="b">
					<!-- <input type="button" value="添加" onclick="add()" />  -->
				</li>				
			</form>		
		<%
			local file = "C:\\zb\\project_app\\ghttp\\car_db.lua";			
			trace_out("dofile = " ..file.. "\n");
			local fun = loadfile(file);  
			fun();
			
			trace_out("car_kind = " .. car_kind .. "\n");
			local item = {};
			if(_G.db[tostring(car_kind)] ~= nil)then
				item = _G.db[car_kind];					
			
				local name = tostring(item.name);
		%>	
			<div data-role="collapsible" data-collapsed="false">
				<h1>车辆信息</h1>
				
				<p>车型：<%=item.car_kind%></p>
				<p>售价：<%=item.price%></p>
				<p>预估全款：<%=item.all_price%></p>
				<p>平均油耗：<%=item.oil%></p>
				<p>厂商：<%=item.factory%></p>
				<p>级别：<%=item.class_id%></p>
				<p>上市时间：<%=item.sale_time%></p>
				<p>发动机：<%=item.engine%></p>
				<p>变速箱：<%=item.gear_case%></p>
				<p>长宽高(mm)：<%=item.size%></p>
				<p>车身结构：<%=item.structure%></p>
				<p>最高车速（km/h）：<%=item.max_speed%></p>
				<p>整备重量：<%=item.weight%></p>
				<p>油箱容积：<%=item.oil_size%></p>
			</div><b>	

		<%
			else			
		%>
			<h1 align="center">车型没有查到，请重新输入车型。</h1>
		<script> 
			// 以下方式直接跳转
			setTimeout("javascript:location.href='car_mgr_delete.lp'", 4000); 
			
		</script>
		<%
			end			
		%>
		
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
