<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>保单服务</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
				
				
			<div data-role="content" >
					<ul data-role="listview">
					  <li><a href="insurance_find.lp"> <img src="images/1.jpg" />三包查询</a></li>
					  <li><a href="login.lp"> <img src="images/2.jpg" />三包管理</a></li>		
					</ul>
					
			
			</div>
			
				
				
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
