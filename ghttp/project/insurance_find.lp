<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 

	
	%>
<html>
	<head>
		<title>保单查询</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>			
				<form action="insurance_find_result.lp" method="post">
					<ul data-role="listview" data-insert="true">
						<li data-role="fieldcontain">
							<label for="name">请输入车主姓名或者车辆识别码(车架号)：</label>
								
						</li>

						<li data-role="fieldcontain">
							<label for="name">车主姓名:</label>
								<input type = "text" name = "name" id="name">
						</li>
						<li data-role="fieldcontain">
							<label for="car_id">车辆识别码(车架号):</label>
								<input type = "text" name = "car_id" id="car_id">
						</li>
						
						<!--
						<li data-role="fieldcontain">
							<label for="engine_id">发动机号:</label>
								<input type = "text" name = "engine_id" id="engine_id">
						</li>
						<li data-role="fieldcontain">
							<label for="name">姓名:</label>
								<input type="password" name="name" id = "name">
						</li>
						
						-->
					
						<li data-role="fieldcontain">
							<input type = "submit" value = "查询" data-theme="b">
						</li>
					</ul>
				</form>
			
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
