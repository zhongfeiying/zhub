<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	local loadfile = _G.loadfile   
	local pairs = _G.pairs   
	%>
<html>
	<head>
		<title>删除保单</title>
		<%=base.head %>		
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
	]
		
				<form action="policy_delete_info.lp" method="post">
					<h1>请输入:</h1>
					<ul data-role="listview" data-insert="true">							
						<li data-role="fieldcontain">
							<label for="car_id">车辆识别码(车架号):</label>
								<input type = "text" name = "car_id" id="car_id">
						</li>					 

						<li data-role="fieldcontain">
							<input type = "submit" value = "删除" data-theme="b">
						</li>
					</ul>
				</form>
			
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
