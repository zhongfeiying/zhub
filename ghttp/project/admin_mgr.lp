<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
	<head>
		<title>管理界面</title>
		<%=base.head %>
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>
	
			
			<div data-role="content" >
					<ol data-role="listview">
					  <li><a href="insurance_mgr.lp">管理三包保单</a></li>
					  <li><a href="car_mgr.lp">管理新车</a></li>
					<!--  <li><a href="sec_hand_car_mgr.lp">管理二手车</a></li>		-->
					  <li><a href="designing.lp">管理二手车</a></li>		
					  <li><a href="index_car.lp">测试新车显示模块</a></li>		
					</ol>
			
			</div>
			
			
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
