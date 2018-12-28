<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 
	
	%>
	
		
<html>
	<head>
		<title>您的车</title>
		<%=base.head %>


   <!--///////////////////////////////////////////////////////////////////////////////////////////////////
 	<meta http-equiv="refresh" content="2" method="post">
   //
    //		Styles
    //
    ///////////////////////////////////////////////////////////////////////////////////////////////////--> 
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
	<!-- 该style是设置表格的颜色--> 
	<style>
		.ui-block-a, 
		.ui-block-b, 
		.ui-block-c 
		{
			background-color: MintCream;
			border: 1px solid PaleGreen;
			height: 20px;
			font-weight: bold;
			text-align: center;
			padding: 20px;
		}
	</style>
    <!--///////////////////////////////////////////////////////////////////////////////////////////////////
    //
    //		Scripts
    //
    ///////////////////////////////////////////////////////////////////////////////////////////////////--> 

	<script>			
		alert("navigate"); 
		//window.location.reload()刷新当前页面.
		//document.URL=location.href;
	</script>	 
	
	<link rel='stylesheet' id='camera-css'  href='../css/camera.css' type='text/css' media='all'> 
	<script type='text/javascript' src='../scripts/jquery.min.js'></script>
    <script type='text/javascript' src='../scripts/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='../scripts/jquery.easing.1.3.js'></script> 
    <script type='text/javascript' src='../scripts/camera.min.js'></script> 
  
	
		
	</head>
	
	
	<body> 

	
	
	
	
	<script>		
		
	</script>	
		
		
		<div data-role="page">		
	
			<a href="javascript:opener.location.reload()">刷新</a> 
		
			<div class="fluid_container"> 			
				<!-- 图片展示 -->	
				<div class="camera_wrap camera_azure_skin" id="camera_wrap_1" >
						<div data-thumb="../images/slides/thumbs/bridge.jpg" data-src="../images/slides/bridge.jpg">
							<div class="camera_caption fadeFromBottom">
								Good Car <em> Buy</em>
							</div>
						</div>
						<div data-thumb="../images/slides/thumbs/leaf.jpg" data-src="../images/slides/leaf.jpg">
							<div class="camera_caption fadeFromBottom">
								Good Car <em> Buy</em>
							</div>
						</div>
					   
				</div>	
				
				<div data-role="collapsible-set">

						
					<div data-role="collapsible" data-collapsed="false" data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
								<h1>新车信息</h1>
								
								<div class="ui-grid-a">
									<div class="ui-block-a"><span>品牌:</span></div>
									<div class="ui-block-b"><span>玛莎拉蒂</span></div>
								</div>				
								<div class="ui-grid-a">
									<div class="ui-block-a"><span>价格:</span></div>
									<div class="ui-block-b"><span>111W</span></div>
								</div>				
								<div class="ui-grid-a">
									<div class="ui-block-a"><span>进口国：</span></div>
									<div class="ui-block-b"><span>英国</span></div>
								</div>				
								<div class="ui-grid-a">
									<div class="ui-block-a"><span>状态：</span></div>
									<div class="ui-block-b"><span>已打税/天津库</span></div>
								</div>	
								
					</div>		

					<div data-role="collapsible" data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
						<h1>基本参数</h1>
						
							
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>厂商:</span></div>
							<div class="ui-block-b"><span>莱万特高功率S</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>级别:</span></div>
							<div class="ui-block-b"><span>莱万特高功率S</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>发动机:</span></div>
							<div class="ui-block-b"><span>3.0T汽油</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>变速箱</span></div>
							<div class="ui-block-b"><span>424马力（大功率）</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>车身结构</span></div>
							<div class="ui-block-b"><span>8速</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>长*宽*高(mm)</span></div>
							<div class="ui-block-b"><span>四驱</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>轴距(mm)</span></div>
							<div class="ui-block-b"><span>空气悬挂</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>行李箱容积(L)</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>整备质量(kg)</span></div>
							<div class="ui-block-b"><span>集成LED日行灯/LED尾灯</span></div>
						</div>				
					
					</div>	
					
					
					<div data-role="collapsible"  data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
						<h1>发动机参数</h1>				
							
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>排量(L)</span></div>
							<div class="ui-block-b"><span>法拉利</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>进气形式</span></div>
							<div class="ui-block-b"><span>89万</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>气缸</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>最大马力(Ps)</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>最大扭矩(N*m)</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>燃料类型</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>燃油标号</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>供油方式</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>排放标准</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						

						
					</div>		
				
					<div data-role="collapsible"  data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
						<h1>底盘及制动</h1>
						
							
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>驱动方式</span></div>
							<div class="ui-block-b"><span>法拉利</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>助力类型</span></div>
							<div class="ui-block-b"><span>89万</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前悬挂类型</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>后悬挂类型</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前制动类型</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>后制动类型</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前轮胎规格</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>后轮胎规格</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						

						
					</div>		
				
					<div data-role="collapsible"  data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
						<h1>安全配置</h1>
						
							
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>主副驾驶安全气囊</span></div>
							<div class="ui-block-b"><span>法拉利</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前后排侧气囊</span></div>
							<div class="ui-block-b"><span>89万</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>胎压检测</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>车内中控锁</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>儿童座椅接口</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>无钥匙启动</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>防抱死系统(ABS)</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>车身稳定控制(ESP)</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						

						
					</div>		
					<div data-role="collapsible" data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
						<h1>外部配置</h1>
						
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前灯</span></div>
							<div class="ui-block-b"><span>全景天窗</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>辅灯</span></div>
							<div class="ui-block-b"><span>全景天窗</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>电动天窗</span></div>
							<div class="ui-block-b"><span>全景天窗</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>全景天窗</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>电动吸合门</span></div>
							<div class="ui-block-b"><span>电动座椅带记忆</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>感应后备箱</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>			
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>感应雨刷</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>			
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>后雨刷</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>			
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前后电动车窗</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>			
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>后视镜电动调节</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>			
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>后视镜加热</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>			


						
					</div>		
					<div data-role="collapsible" data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u">
						<h1>内部配置</h1>
						
							
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>多功能方向盘</span></div>
							<div class="ui-block-b"><span>法拉利</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>定速巡航</span></div>
							<div class="ui-block-b"><span>89万</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>自动空调</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>GPS导航</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>倒车雷达</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>倒车影像系统</span></div>
							<div class="ui-block-b"><span>无</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>真皮座椅</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						<div class="ui-grid-a">
							<div class="ui-block-a"><span>前后排座椅加热</span></div>
							<div class="ui-block-b"><span>标配</span></div>
						</div>				
						

						
					</div>		
					
				</div>			
	
	</div>		
				<%=base.footer_main() %>		
		</div>
		
	</body>
</html>
