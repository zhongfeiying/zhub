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
		<title>搜索到的保单</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
			
			
			<form action="policy_delete_result.lp" method="post">
				<ul data-role="listview" data-insert="true">
					<li data-role="fieldcontain">
						<label for="car_id">车辆识别码:</label>
							<input type = "text" name = "car_id" id="car_id" value = <%=car_id%> required="required">
					</li>
				</ul
				<li data-role="fieldcontain">
					<input type = "submit" value = "删除信息" data-theme="b">
					<!-- <input type="button" value="添加" onclick="add()" />  -->
				</li>				
			</form>		
		<%
			local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";			
			trace_out("dofile = " ..file.. "\n");
			local fun = loadfile(file);  
			fun();
			
			trace_out("car_id = " .. car_id .. "\n");
			local item = {};
			if(_G.db[tostring(car_id)] ~= nil)then
				item = _G.db[car_id];					
			
				local name = tostring(item.name);
				--local name = _G.luaext.a2u(tostring(item.name));
				--local company_id = utf8.codes(tostring(item.company_id));
				--local brand = utf8.codes(tostring(item.brand));
				--ocal color = utf8.codes(tostring(item.color));				
		%>	
			<div data-role="collapsible" data-collapsed="false">
				<h1>保单信息</h1>
				
				<p>车辆识别码(车架号)：<%=item.ngine_id%></p>
				<p>发动机编码：<%=item.car_id%></p>
				<p>车主姓名：<%=item.name%></p>
				<p>身份证号（个人）：<%=item.id%></p>
				<p>组织机构代码证号（单位）：<%=item.company_id%></p>
				<p>车辆品牌：<%=item.brand%></p>
				<p>电话<%=item.phone%></p>
				<p>颜色：<%=item.color%></p>
				<p>地址：<%=item.address%></p>
				<p>销售商：<%=item.sale_factory%></p>
				<p>销售商地址：<%=item.sale_address%></p>
				<p>生产厂商：<%=item.factory%></p>
				<p>购车发票价格：<%=item.price%></p>
				<p>保修类型：<%=item.kind%></p>
				<p>车辆使用性质：<%=item.use_prop%></p>
				<p>质保服务起始日期：<%=item.data_start%></p>
				<p>质保服务期限：<%=item.time%></p>
				<p>客户确认时间：<%=item.data_confim%></p>
				<p>销售代表：<%=item.saleman%></p>
			</div><b>	

		<%
			else			
		%>
			<h1 align="center">保单没有查到，请重新输入车辆识别码(车架号)。</h1>
		<script> 
			// 以下方式直接跳转
			setTimeout("javascript:location.href='policy_delete.lp'", 4000); 
			
		</script>
		<%
			end			
		%>
		
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
