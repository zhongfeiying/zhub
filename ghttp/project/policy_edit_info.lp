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
	_G.require("luaext") 
	
	%>
<html>
	<head>
		<title>编辑保单</title>
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
				
		%>	
		
				<form action="policy_edit_result.lp" method="post">
					<ul data-role="listview" data-insert="true">



					<li data-role="fieldcontain">
							<label for="car_id">车辆识别码:</label>
								<input type = "text" name = "car_id" id="car_id" required="required" value=<%=item.car_id%>>
						</li>
						<li data-role="fieldcontain">
							<label for="engine_id">发动机编码:</label>
								<input type="text" name="engine_id" id = "engine_id" required="required" value=<%=item.engine_id%>>
						</li>
						<li data-role="fieldcontain">
							<label for="name">车主姓名:</label>
								<input type="text" name="name" id = "name" required="required" value=<%=item.name%>>
						</li>
						<li data-role="fieldcontain">
							<label for="id">身份证号（个人）:</label>
								<input type="text" name="id" id = "id" value=<%=item.id%>>
						</li>
						<li data-role="fieldcontain">
							<label for="company_id">组织机构代码证号（单位）:</label>
								<input type="text" name="company_id" id = "company_id"  value=<%=item.company_id%>>
						</li>
						<li data-role="fieldcontain">
							<label for="phone">联系电话:</label>
								<input type="text" name="phone" id = "phone" value=<%=item.phone%>>
						</li>
						<li data-role="fieldcontain">
							<label for="brand">车辆品牌：</label>
								<input type="text" name="brand" id = "brand" required="required" value=<%=item.brand%>>										 
						</li>
						
						
						<li data-role="fieldcontain">
							<label for="color">颜色：</label>
								<input type="text" name="color" id = "color" required="required" value=<%=item.color%>>	
						</li>


					
						<li data-role="fieldcontain">
							<label for="address">地址:</label>
								<input type="text" name="address" id = "address" required="required" value=<%=item.address%>>
						</li>
						
						<li data-role="fieldcontain">
							<label for="sale_factory">销售商：</label>
								<input type="text" name="sale_factory" id = "sale_factory" required="required" value=<%=item.sale_factory%>>											 
						</li>
						<li data-role="fieldcontain">
							<label for="sale_address">销售商地址：</label>
								<input type="text" name="sale_address" id = "sale_address" required="required" value=<%=item.sale_address%>>											 
						</li>

						<li data-role="fieldcontain">
							<label for="factory">生产厂商:</label>
								<input type="text" name="factory" id = "factory" required="required" value=<%=item.factory%>>
						</li>
						<li data-role="fieldcontain">
							<label for="price">购车发票价格:</label>
								<input type="text" name="price" id = "price" required="required" value=<%=item.price%>>
						</li>
							
						<li data-role="fieldcontain">
							<label for="kind">保修类型</label>
								<select name="kind" id="kind" value=<%=item.kind%>>
								  <option value="A款（三大件三年或六万公里）">A款（三大件三年或六万公里）</option>
								  <option value="B款（整车质保三年或六万公里）">B款（整车质保三年或六万公里）</option>
								  <option value="C款（整车质保两年或五万公里）">C款（整车质保两年或五万公里）</option>
								
								</select>						 
						</li>
						<li data-role="fieldcontain">
							<label for="use_prop">车辆使用性质</label>
								<select name="use_prop" dayid="use_prop" value=<%=item.use_prop%>>
								  <option value="企业">企业</option>
								  <option value="个人">个人</option>
								
								</select>						 
						</li>
						
						<li data-role="fieldcontain">
							<label for="data_start">质保服务起始日期:</label>
								<input type="text" name="data_start" id = "data_start" required="required" value=<%=item.data_start%>>
						</li>
						<li data-role="fieldcontain">
							<label for="time">质保服务期限:</label>
								<input type="text" name="time" id = "time" required="required" value=<%=item.time%>>
						</li>
						<li data-role="fieldcontain">
							<label for="data_confim">客户确认时间:</label>
								<input type="text" name="data_confim" id = "data_confim" required="required" value=<%=item.data_confim%>>
						</li>
						<li data-role="fieldcontain">
							<label for="saleman">销售代表:</label>
								<input type="text" name="saleman" id = "saleman" required="required" value=<%=item.saleman%>>
						</li>
					
						<li data-role="fieldcontain">
							<input type = "submit" value = "编辑" data-theme="b">
							<!-- <input type="button" value="添加" onclick="add()" />  -->
						</li>
					</ul>
				</form>
			<%
				end
			%>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
