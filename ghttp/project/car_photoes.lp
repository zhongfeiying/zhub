<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 
	
	%>
	
<html>
	<head>
	<title>美车相册</title>
	<%=base.head %>	
	
	</head>
	
	
	<body>
		<div data-role="page" id="car_detail_page">		
			
			<meta name="author" content="Ste Brennan - Code Computerlove - http://www.codecomputerlove.com/" />
			<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
			<meta name="apple-mobile-web-app-capable" content="yes" />
			
			<link href="styles.css" type="text/css" rel="stylesheet" />
			
			<link href="photoswipe.css" type="text/css" rel="stylesheet" />
			
			<script type="text/javascript" src="lib/klass.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
			
			<script type="text/javascript" src="code.photoswipe.jquery-3.0.5.min.js"></script>
			
			
			<script type="text/javascript">

				(function(window, $, PhotoSwipe){
					
					$(document).ready(function(){
						
						var options = {};
						$("#Gallery a").photoSwipe(options);
					
					});
					
					
				}(window, window.jQuery, window.Code.PhotoSwipe));
				
			</script>
				



				<div id="MainContent">

					<div class="page-content">
						
					</div>
					
					<ul id="Gallery" class="gallery">
						
						<li><a href="images/car/1.jpg"><img src="images/car/1.jpg" alt="Image 001" /></a></li>
						<li><a href="images/car/2.jpg"><img src="images/car/2.jpg" alt="Image 002" /></a></li>
						<li><a href="images/car/3.jpg"><img src="images/car/3.jpg" alt="Image 003" /></a></li>
						<li><a href="images/car/5.jpg"><img src="images/car/5.jpg" alt="Image 005" /></a></li>
						<li><a href="images/car/6.jpg"><img src="images/car/6.jpg" alt="Image 006" /></a></li>
						<li><a href="images/car/7.jpg"><img src="images/car/7.jpg" alt="Image 007" /></a></li>
						<li><a href="images/car/8.jpg"><img src="images/car/8.jpg" alt="Image 008" /></a></li>
						<li><a href="images/car/9.jpg"><img src="images/car/9.jpg" alt="Image 009" /></a></li>
					</ul>
					
				</div>	

			<%=base.footer_main() %>		
	
		</div>
	
	</body>
</html>
