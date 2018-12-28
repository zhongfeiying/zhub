<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	local trace_out = _G.trace_out   
	local loadfile = _G.loadfile   
	
	%>
<html>
	<head>
		<title>添加新车</title>
		<%=base.head %>
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>	
	
			<%
				local file = "C:\\zb\\project_app\\ghttp\\temp_data_car.lua";			
				local fun = loadfile(file);  
				fun();
				
			%>	

						
				<form action="car_mgr_add_ok.lp" method="post"  enctype="multipart/form-data" data-ajax="false">
					<ul data-role="listview" data-insert="true">
						<li data-role="fieldcontain">
							<label for="car_kind">车型:</label>
								<input type="text" name="car_kind" id = "car_kind" required="required" value=<%=_G.info.car_kind%>>
						</li>
		
						<li data-role="fieldcontain">
							<label for="price">售价:</label>
								<input type="text" name="price" id = "price" required="required" value=<%=_G.info.price%>>
						</li>
						<li data-role="fieldcontain">
							<label for="all_price">预估全款:</label>
								<input type="text" name="all_price" id = "all_price" required="required" value=<%=_G.info.all_price%>>
						</li>
						<li data-role="fieldcontain">
							<label for="oil">平均油耗:</label>
								<input type="text" name="oil" id = "oil" required="required" value=<%=_G.info.oil%>>
						</li>
						<li data-role="fieldcontain">
							<label for="factory">厂商:</label>
								<input type="text" name="factory" id = "factory" value=<%=_G.info.factory%>>
						</li>
						<li data-role="fieldcontain">
							<label for="class_id">级别:</label>
								<input type="text" name="class_id" id = "class_id" value=<%=_G.info.class_id%>>
						</li>
						<li data-role="fieldcontain">
							<label for="sale_time">上市时间:</label>
								<input type="text" name="sale_time" id = "sale_time" value=<%=_G.info.sale_time%>>
						</li>
						
						<li data-role="fieldcontain">
							<label for="engine">发动机：</label>
								<input type="text" name="engine" id = "engine" value=<%=_G.info.engine%>>										 
						</li>
						
						
						<li data-role="fieldcontain">
							<label for="gear_case">变速箱：</label>
								<input type="text" name="gear_case" id = "gear_case" value=<%=_G.info.gear_case%>>	
						</li>

					
						<li data-role="fieldcontain">
							<label for="size">长宽高(mm):</label>
								<input type="text" name="size" id = "size" value=<%=_G.info.size%>>
						</li>
						
						<li data-role="fieldcontain">
							<label for="structure">车身结构：</label>
								<input type="text" name="structure" id = "structure" value=<%=_G.info.structure%>>											 
						</li>

						<li data-role="fieldcontain">
							<label for="max_speed">最高车速（km/h）:</label>
								<input type="text" name="max_speed" id = "max_speed" value=<%=_G.info.max_speed%>>
						</li>
						<li data-role="fieldcontain">
							<label for="weight">整备重量:</label>
								<input type="text" name="weight" id = "weight" value=<%=_G.info.weight%>>
						</li>				
						
						<li data-role="fieldcontain">
							<label for="oil_size">油箱容积:</label>
								<input type="text" name="oil_size" id = "oil_size" value=<%=_G.info.oil_size%>>
						</li>
				
				<!--<form action="gxy.lp" method="post" enctype="multipart/form-data" data-ajax="false"> -->
							
						<li data-role="fieldcontain">
							<label for="file">车图片1:</label>
								<input type="file" name="picture_1"  id="picture_1"  /> 
						</li>
								
				<!-- 	</form> -->		
								
								
				
						<li data-role="fieldcontain">
							<input type = "submit" value = "添加" data-theme="b">
							<!-- <input type="button" value="添加" onclick="add()" />  -->
						</li>
					</ul>
					
					
				</form>
						 							 

			<%=base.footer_main() %>		
		</div>
	</body>
</html>
