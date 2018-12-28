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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		
		<title>您的车全部图集</title>

		<!--必要样式-->
		<link rel="stylesheet" href="css/photoswipe.css"> 
		<link rel="stylesheet" href="css/default-skin/default-skin.css"> 
		
		
		<script src="js/photoswipe.min.js"></script> 
		<script src="js/photoswipe-ui-default.min.js"></script> 
		
		
	</head>
	
	
	<body>
		<div data-role="page">

		<div class="fluid_container">
    	
		<div style="text-align:center;"><h1>车型图片</h1> </div>	
		<div id="main">
			<div class="demo">			
				<div id="photos">
					<img src="images/car/1.jpg" alt="Image description" width="640" height="480" />
					
					
					<p>图集</p>
				</div>
			
				<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
			
					<div class="pswp__bg"></div>
						<div class="pswp__scroll-wrap">
							<div class="pswp__container">
								<div class="pswp__item"></div>
								<div class="pswp__item"></div>
								<div class="pswp__item"></div>
							</div>
							<div class="pswp__ui pswp__ui--hidden">
								<div class="pswp__top-bar">
									<div class="pswp__counter"></div>
									<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
									<button class="pswp__button pswp__button--share" title="Share"></button>
									<button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
									<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
									<div class="pswp__preloader">
										<div class="pswp__preloader__icn">
											<div class="pswp__preloader__cut">
												<div class="pswp__preloader__donut"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
									<div class="pswp__share-tooltip"></div> 
								</div>
								<button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
								<button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
								<div class="pswp__caption">
									<div class="pswp__caption__center"></div>
								</div>
							</div>
						</div>
					</div>
					
				</div>

		</div>

		<script type="text/javascript">
		var openPhotoSwipe = function() {
			var pswpElement = document.querySelectorAll('.pswp')[0];

			var items = [
				{
					src: 'images/car/1.jpg',
					w: 640,
					h: 480
				},
				{
					src: 'images/car/2.jpg',
					w: 640,
					h: 480
				},
				{
					src: 'images/car/3.jpg',
					w: 640,
					h: 480
				},
				{
					src: 'images/car/4.png',
					w: 640,
					h: 480
				},
				{
					src: 'images/car/5.jpg',
					w: 640,
					h: 480
				}
			];
			
			var options = {
				history: false,
				focus: false,

				showAnimationDuration: 0,
				hideAnimationDuration: 0
				
			};
			
			var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
			gallery.init();
			
		};

		document.getElementById('photos').onclick = openPhotoSwipe;
		
		</script>
		
		
	
		</div>
	</body>
</html>
