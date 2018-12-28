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
		<title>新车管理</title>
		<%=base.head %>

	</head>
	<body>
	
	
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>				
			<div data-role="content" >
				  <div data-role="main" class="ui-content">
					  <p>操作项目:</p>
					  <br><br>
				
					  	<ul data-role="listview">
							<li><a href="car_mgr_add.lp"> <img src="images/car_2.jpg" />添加新车</a></li>
							<li><a href="designing.lp"> <img src="images/2.jpg" />编辑新车</a></li>		
							<li><a href="car_mgr_delete.lp"> <img src="images/3.jpg" />删除新车</a></li>		
						</ul>
						<br><br><br>						
				   
					<table data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" data-column-btn-text="显示或隐藏列" id="myTable">
					  <thead>
						<tr>
						   <th data-priority="14">ID</th>
						   <th>车型</th>
						  <th data-priority="1">售价</th>
						  <th data-priority="2">预估全款</th>
						  <th data-priority="3">平均油耗</th>
						  <th data-priority="4">厂商</th>
						  <th data-priority="5">>级别</th>
						  <th data-priority="6">>上市时间</th>
						  <th data-priority="7">>发动机</th>
						  <th data-priority="8">>变速箱</th>
						  <th data-priority="9">>长宽高(mm)</th>
						  <th data-priority="10">>车身结构</th>
						  <th data-priority="11">>最高车速（km/h）</th>
						  <th data-priority="12">>整备重量</th>
						  <th data-priority="13">>油箱容积</th>
						
						</tr>
					  </thead>
					  <tbody>
						
							
							
						<%
							local file = "C:\\zb\\project_app\\ghttp\\car_db.lua";			
							local fun = loadfile(file);  
							fun();
													
							for k,v in pairs(_G.db) do
						%>								
				<!--		
				<tr>
							  <td><%=v.car_kind%></td>
							  <td><%=v.price%></td>
							  <td><%=v.all_price%></td>
							  <td><%=v.oil%></td>
							  <td><%=v.factory%></td>
							  <td><%=v.class_id%></td>
							  <td><%=v.sale_time%></td>
							  <td><%=v.engine%></td>
							  <td><%=v.gear_case%></td>
							  <td><%=v.size%></td>
							  <td><%=v.structure%></td>
							  <td><%=v.max_speed%></td>
							  <td><%=v.weight%></td>
							  <td><%=v.oil_size%></td>
							</tr>
						<%
							end
						%>					
								
		

					  </tbody>
					</table>

					-->
					
			
			</div>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
