<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	local dofile = _G.dofile   
	local table = _G.table   
	local tostring = _G.tostring   
	local trace_out = _G.trace_out   
	local loadfile = _G.loadfile   
	local pairs = _G.pairs   
	
	%>
<html>
	<head>
		<title>您的保单</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
		<%
			local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";			
			trace_out("dofile = " ..file.. "\n");
			--dofile(file);  
			local fun = loadfile(file);  
			fun();
			
			--trace_out("car_id = " .. car_id .. "\n");
			--trace_out("name = " .. name .. "\n");			
			
			local item = nil;
			--搜索相同的用户
			if(name ~="")then
				for k,v in pairs(_G.db) do
					if(v.name == name)then
						item = v;
						break;
					end
				end
			end
			
			if(item == nil)then		
				if(car_id ~= "")then				
					if(_G.db[tostring(car_id)] ~= nil)then
						item = _G.db[car_id];		
					end					
				end
			end
			if(item ~= nil)then
						
					trace_out("item.ngine_id = " .. tostring(item.ngine_id) .. "\n");
				
				
		%>	
			<div data-role="collapsible" data-collapsed="false">
				<h1>保单信息</h1>
				
				<p>车辆识别码(车架号)：<%=item.ngine_id%></p>
				<p>发动机编码：<%=item.car_id%></p>
				<p>合同编号：<%=item.contract_no%></p>
				<p>车主姓名：<%=item.name%></p>
				<p>身份证号（个人）：<%=item.id%></p>
				<p>组织机构代码证号（单位）：<%=item.company_id%></p>
				<p>车辆品牌：<%=item.brand%></p>
				<p>电话<%=item.phone%></p>
				<p>颜色：<%=item.color%></p>
				<p>地址：<%=item.address%></p>
				<p>销售商地址：<%=item.sale_address%></p>
				<p>生产厂商：<%=item.factory%></p>
				<p>购车发票价格：<%=item.price%></p>
				<p>保修类型：<%=item.kind%></p>
				<p>车辆使用性质：<%=item.use_prop%></p>
				<p>质保服务起始日期：<%=item.data_start%></p>
				<p>质保服务期限：<%=item.time%></p>
				<p>客户确认时间：<%=item.data_confim%></p>
				<p>销售代表：<%=item.saleman%></p>
			</div>
		<!--
			<div data-role="collapsible" data-collapsed="false">
				<h1>第三者</h1>
				<p>保费：1200元</p>
				<p>保额：50万</p>
			</div>
		-->	
		<%
			else			
		%>
			<h1 align="center">保单没有查到，请重新输入姓名或者车辆识别码(车架号)。</h1>
		<script> 
			// 以下方式直接跳转
			setTimeout("javascript:location.href='insurance_find.lp'", 4000); 
			
		</script>
		<%
			end			
				
		%>
		
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
