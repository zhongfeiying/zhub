<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>汽车用品</title>
		<%=base.head %>
		
			
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>
	
		<h1>本版块实现中，敬请期待！！！</h1>
	
	
	<!--		
			<div data-role="content" >
					<ul data-role="listview">
					  <li><a href="#"> <img src="images/4.jpg" />软装类</a></li>		
					  <li><a href="#"> <img src="images/3.jpg" />酷饰类</a></li>
					  <li><a href="#"> <img src="images/2.jpg" />保养类</a></li>
					  <li><a href="#"> <img src="images/1.jpg" />配件类</a></li>
					</ul>
			
			</div>
			
			-->
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
