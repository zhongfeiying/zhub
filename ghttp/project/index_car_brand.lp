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
			<h1 align="center">设置</h1>	
	
			
			<div data-role="content" >
					<ol data-role="listview">
					  <li><a href="car_mgr.lp">管理新车</a></li>
					  <li><a href="#">管理二手车</a></li>		
					  <li><a href="#">在线帮助</a></li>
					  <li><a href="#">意见反馈</a></li>
					  <li><a href="#">关于</a></li>
					  <li><a href="#">清除缓存</a></li>					
					  <li><a href="#">退出登录</a></li>
					</ol>
			
			</div>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
