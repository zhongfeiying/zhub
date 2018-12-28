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
			 <img src="images/2.jpg" width=100%/>				
			<div data-role="content" >
				  <div data-role="main" class="ui-content">
					  <p>操作项目:</p>
					  <br><br>
				
					  	<ul data-role="listview">
							<li><a href="car_add.lp"> <img src="images/1.jpg" />添加新车</a></li>
							<li><a href="car_edit.lp"> <img src="images/2.jpg" />编辑新车</a></li>		
							<li><a href="car_delete.lp"> <img src="images/3.jpg" />删除新车</a></li>		
						</ul>
						<br><br><br>						
				   
					<table data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" data-column-btn-text="显示或隐藏列" id="myTable">
					  <thead>
						<tr>
						   <th data-priority="17">车架号</th>
						   <th>车架号</th>
						  <th data-priority="1">发动机编码</th>
						  <th data-priority="2">车主姓名</th>
						  <th data-priority="3">身份证号（个人）</th>
						  <th data-priority="4">机构代码（单位）</th>
						  <th data-priority="5">>电话</th>
						  <th data-priority="6">>品牌</th>
						  <th data-priority="7">>颜色：</th>
						  <th data-priority="8">>地址</th>
						  <th data-priority="9">>销售商地址：</th>
						  <th data-priority="10">>生产厂商</th>
						  <th data-priority="11">>保修类型</th>
						  <th data-priority="12">>使用性质</th>
						  <th data-priority="13">>质保起始日期</th>
						  <th data-priority="14">>质保期限</th>
						  <th data-priority="15">>确认时间</th>
						  <th data-priority="16">>销售代表</th>
						
						</tr>
					  </thead>
					  <tbody>
						
										
						<%
							local file = "C:\\zb\\project_app\\ghttp\\policy_db.lua";			
							local fun = loadfile(file);  
							fun();
													
							for k,v in pairs(_G.db) do
						%>								
							<tr>
							  <td><%=v.car_id%></td>
							  <td><%=v.engine_id%></td>
							  <td><%=v.name%></td>
							  <td><%=v.id%></td>
							  <td><%=v.company_id%></td>
							  <td><%=v.brand%></td>
							  <td><%=v.color%></td>
							  <td><%=v.phone%></td>
							  <td><%=v.address%></td>
							  <td><%=v.sale_address%></td>
							  <td><%=v.factory%></td>
							  <td><%=v.price%></td>
							  <td><%=v.kind%></td>
							  <td><%=v.use_prop%></td>
							  <td><%=v.data_start%></td>
							  <td><%=v.time%></td>
							  <td><%=v.data_confim%></td>
							  <td><%=v.saleman%></td>
							</tr>
						<%
							end
						%>					
								
		

					  </tbody>
					</table>

					
			
			</div>
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
