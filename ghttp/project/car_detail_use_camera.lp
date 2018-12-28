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
			 text-align:center;
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
	jQuery('#camera_wrap_1').camera({
				thumbnails: true,
				time:1,
				hover:true,
				autoAdvance:true,
				navigation: true,
				playPause:true,
			
			});
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

		/*
		$(document).ready(function(){ 
			var userName="xiaoming"; 
			alert(userName); 
		});
*/		
	</script>

	
		
	</head>
	
	
	<body > 
	
   
<div data-role="page">		
	<div class="fluid_container">
  
	<div class="camera_wrap camera_azure_skin" id="camera_wrap_2">
            <div data-thumb="../images/slides/thumbs/bridge.jpg" data-src="../images/slides/bridge.jpg">
                <div class="camera_caption fadeFromBottom">
                  <!--  Camera is a responsive/adaptive slideshow. <em>Try to resize the browser window</em>-->
                </div>
            </div>
            <div data-thumb="../images/slides/thumbs/leaf.jpg" data-src="../images/slides/leaf.jpg">
                <div class="camera_caption fadeFromBottom">
                  <!--  It uses a light version of jQuery mobile, <em>navigate the slides by swiping with your fingers</em>-->
                </div>
            </div>
            <div data-thumb="../images/slides/thumbs/road.jpg" data-src="../images/slides/road.jpg">
                <div class="camera_caption fadeFromBottom">
                  <!--  <em>It's completely free</em> (even if a donation is appreciated)-->
                </div>
            </div>         
	</div>	

		<p style="text-align: center"><a href="car_photoes.lp" >浏览完整图库</a></p>

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
