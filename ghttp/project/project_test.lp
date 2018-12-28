<!DOCTYPE html>
<% _G.package.loaded["project.base"] = nil %>
<% _G.package.loaded["project.mgr_session"] = nil %>
<% local base = _G.require("project.base") %>
<% local mgr_session = _G.require("project.mgr_session") %>
<html>
<head>
<title>欢迎来到国瑞车友会!</title>
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
	 <!--
	 <img src="images/4.jpg" width=100%/> 
            <div data-thumb="../images/car_2.jpg" data-src="images/car_2">
    	<p>广告位，欢迎使用</p>
	
	-->
	
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
          
        </div><!-- #camera_wrap_2 -->

		
		<a href="car_detail.lp">link</a> 
		
	 <%=base.footer_main() %>
 </div>
</body>
</html>
