<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>选择排序方式</title>
		<%=base.head %>
	</head>
	<body>
		<div data-role="page">
			<h1 align="center">排序规则</h1>	
			<div data-role="content" >
					<ol data-role="listview">
					  <li><a href="car_mgr.lp"><img src="images/2.jpg" alt="USA" class="ui-li-icon">智能排序</a></li>
					  <li><a href="#"><img src="images/2.jpg" alt="USA" class="ui-li-icon">最新上架</a></li>		
					  <li><a href="#"><img src="images/2.jpg" alt="USA" class="ui-li-icon">价格最低</a></li>
					  <li><a href="#"><img src="images/2.jpg" alt="USA" class="ui-li-icon">价格最高</a></li>
					  <li><a href="#"><img src="images/2.jpg" alt="USA" class="ui-li-icon">车龄最短</a></li>
					  <li><a href="#"><img src="images/2.jpg" alt="USA" class="ui-li-icon">里程最少</a></li>					
					</ol>
			
			</div>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
