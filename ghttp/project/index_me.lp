<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>用户信息</title>
		<%=base.head %>
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>
	
			<div data-role="content" >
					<ol data-role="listview">
					  <li><a href="login.lp">登陆管理界面</a></li>
					  <li><a href="#">清除缓存</a></li>					
					  <li><a href="#">关于</a></li>
					</ol>
			
			</div>
			
			
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
