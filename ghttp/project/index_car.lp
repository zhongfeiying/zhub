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
		<title>汽车市场</title>
		<%=base.head %>
		
		 <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />	
	</head>
	<body>
		<div data-role="page">
			 <img src="images/car_2.jpg" width=100%/>
	
		
	<!--
		  <div data-role="main" class="ui-content">
			<a href="index_car_sort.lp" class="ui-btn  ui-mini ui-icon-arrow-d ui-btn-inline ui-btn-icon-left ui-corner-all ui-shadow">排序</a>
			<a href="index_car_brand.lp" class="ui-btn ui-mini  ui-icon-arrow-d ui-btn-inline ui-btn-icon-left ui-corner-all ui-shadow">品牌</a>
			<a href="index_car_price.lp" class="ui-btn ui-mini  ui-icon-arrow-d ui-btn-inline ui-btn-icon-left ui-corner-all ui-shadow">价格</a>
			<a href="index_car_flite.lp" class="ui-btn ui-mini  ui-icon-arrow-d ui-btn-inline ui-btn-icon-left ui-corner-all ui-shadow">过滤</a>
		  </div>			

			  <p><a href="#">新品推荐</a></p>
			  <script src="js/index.js"></script>
	-->	
			<div data-role="content" >
					<ul data-role="listview">
					  <li>
						<a href="car_detail.lp">
							<img src="images/car_1.jpg" />
							 <h3>2017款美规/玛莎拉蒂</h3>
							 <p>111万 (原价134万)</p>
						</a>
					  </li>		
					 
					</ul>
			
			</div>
			<br>
			<br>
			
		

	<!--					  
	<form action="gxy.lp" method="post" enctype="multipart/form-data" data-ajax="false">
			
		<li data-role="fieldcontain">
			<label for="file">文件名:</label>
				<input type="file" name="testfile"  id="testfile"  /> 
		</li>
		<li data-role="fieldcontain">
			<input type = "submit" value = "上传" data-theme="b">
		</li>
			
		</form>
		-->		  
					  
	
			
			
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
