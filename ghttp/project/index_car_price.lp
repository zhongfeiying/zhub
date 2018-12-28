<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>价格区间</title>
		<%=base.head %>
	</head>
	<body>
		<div data-role="page">
			<h1 align="center">常用价格区间</h1>	
	
			
			<div data-role="content" >
					<ol data-role="listview">
					  <li><a href="car_mgr.lp">不限</a></li>
					  <li><a href="#">5万以下</a></li>		
					  <li><a href="#">5-10万</a></li>
					  <li><a href="#">10-20万</a></li>					
					  <li><a href="#">20-30万</a></li>
					  <li><a href="#">30-40万</a></li>
					  <li><a href="#">40-50万</a></li>
					  <li><a href="#">50-60万</a></li>
					  <li><a href="#">60-70万</a></li>
					  <li><a href="#">70-80万</a></li>
					  <li><a href="#">80-90万</a></li>
					  <li><a href="#">90-100万</a></li>
					  <li><a href="#">100万以上</a></li>
					</ol>
			
			</div>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
