<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>汽车代驾</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_1.jpg" width=100%/>
	
	
			
			<div data-role="content" >
					<ul data-role="listview">
					  <li><a href="#"> <img src="images/6.jpg" />定位</a></li>		
					  <li><a href="#"> <img src="images/7.jpg" />叫车手</a></li>
					  
					</ul>
			
			</div>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
