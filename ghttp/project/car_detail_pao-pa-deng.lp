<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	local dofile = _G.dofile   
	local table = _G.table   
	local tostring = _G.tostring   
	local trace_out = _G.trace_out   
	local loadfile = _G.loadfile   
	
	%>
<html>
	<head>
		<title>您的车</title>
		<%=base.head %>
		


 <link rel='stylesheet' id='camera-css'  href='css/camera.css' type='text/css' media='all'> 
    <style>
		body {
			margin: 0;
			padding: 0;
		}
		a {
			color: #09f;
		}
		a:hover {
			text-decoration: none;
		}
		#back_to_camera {
			clear: both;
			display: block;
			height: 80px;
			line-height: 40px;
			padding: 20px;
		}
		.fluid_container {
			margin: 0 auto;
			max-width: 1000px;
			width: 90%;
		}
	</style>

    <!--///////////////////////////////////////////////////////////////////////////////////////////////////
    //
    //		Scripts
    //
    ///////////////////////////////////////////////////////////////////////////////////////////////////--> 
  
    
    <script>
		jQuery(function(){
			jQuery('#camera_wrap_2').camera({
				height: '400px',
				loader: 'bar',
				pagination: false,
				thumbnails: true
			});
		});
	</script>



			
	</head>
	<body>
		<div data-role="page">
		
         <!-- 图片展示 -->
		
		 <div class="camera_wrap camera_magenta_skin" id="camera_wrap_2">
            <div data-thumb="../images/slides/thumbs/bridge.jpg" data-src="images/slides/bridge.jpg">
                <div class="camera_caption fadeFromBottom">
                   <!-- 车险保平安。 <em>解决您的后顾之忧</em> -->
                </div>
            </div>
            <div data-thumb="../images/slides/thumbs/tree.jpg" data-src="images/slides/tree.jpg">
                <div class="camera_caption fadeFromBottom">
                   <!-- 车险保平安。 <em>解决您的后顾之忧</em> -->
                </div>
            </div>
            <div data-thumb="../images/slides/thumbs/road.jpg" data-src="images/slides/road.jpg">
                <div class="camera_caption fadeFromBottom">
                 <!--   <em>车代安全迅速</em> -->
                </div>
            </div>
             <div data-thumb="../images/slides/thumbs/tree.jpg" data-src="images/slides/tree.jpg">
                <div class="camera_caption fadeFromBottom">
                   <!-- 车险保平安。 <em>解决您的后顾之忧</em> -->
                </div>
            </div>
            <div data-thumb="../images/slides/thumbs/road.jpg" data-src="images/slides/road.jpg">
                <div class="camera_caption fadeFromBottom">
                 <!--   <em>车代安全迅速</em> -->
                </div>
            </div>
         
        </div><!-- #camera_wrap_2 -->
		
		
		<%
			
		%>	
			<div data-role="collapsible" data-collapsed="false">
				<h1>新车信息</h1>
				
				<p>品牌：法拉利</p>
				<p>价格：89万</p>
				<p>进口国：英国</p>
				<p>排量：4.0</p>
				<p>发动机 </p>
				<p>底排悬挂 </p>
				<p>颜色：红色</p>
				<p>销售商地址：国瑞</p>
				
		<!--
				<p>品牌：<%=item.ngine_id%></p>
				<p>价格：<%=item.car_id%></p>
				<p>进口国：<%=item.name%></p>
				<p>排量：<%=item.id%></p>
				<p>发动机<%=item.company_id%></p>
				<p>底排悬挂<%=item.brand%></p>
				<p>颜色：<%=item.color%></p>
				<p>销售商地址：<%=item.sale_address%></p>
			
		-->	
				
			</div>
	
		
			<%=base.footer_main() %>		
		</div>
	</body>
</html>
