local modename = ...
local M = {}
_G[modename] = M
package.loaded[modename] = M

--------------------------------
local url = require("lpp.url")

---------------------------------
_ENV = M


head = [[
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

  
<script type='text/javascript' src='scripts/jquery.min.js'></script>
<script type='text/javascript' src='scripts/jquery.mobile.customized.min.js'></script>
<script type='text/javascript' src='scripts/jquery.easing.1.3.js'></script> 
<script type='text/javascript' src='scripts/camera.min.js'></script> 





]]
function header(sessionid)
	local header_str
	if not sessionid then
		header_str = [[
		<div data-role="header" data-position="fixed">
		<div data-role="navbar">
		<ul>
		<li><a href="index.lp" data-icon="home">登录</a></li>
		<li><a href="register.lp" data-icon="arrow-u">注册</a></li>
		</ul>
		</div>
		</div><!-- /头部 -->
		]]
	else
		header_str = [[
		<div data-role="header" data-position="fixed">
		<div data-role="navbar">
		<ul>
		<li><a href="login.lp?sessionid=]] .. url.escape(sessionid) ..
		[[" data-icon="home">home</a></li>
		<li><a href="register.lp" data-icon="arrow-u">register</a></li>
		</ul>
		</div>
		</div><!-- /头部 -->
		]]
	end
	return header_str
end
pop_header =[[
<div data-role="header" data-postion="fixed">
<h1></h1>
<a href="#main" data-icon="arrow-l" class="ui-btn-left"></a>
</div>
]]


function header_admin(sessionid)
	local header_str
	if not sessionid then
		header_str = [[
		<div data-role="header" data-position="fixed">
		<div data-role="navbar">
		<ul>
		<li><a href="index.lp" data-icon="home">团队管理</a></li>
		<li><a href="register.lp" data-icon="arrow-u">用户管理</a></li>
		<li><a href="register.lp" data-icon="arrow-u">业务统计</a></li>
		<li><a href="register.lp" data-icon="arrow-u">软件设置</a></li>
		</ul>
		</div>
		</div><!-- /头部 -->
		]]
	else
		header_str = [[
		<div data-role="header" data-position="fixed">
		<div data-role="navbar">
		<ul>
		<li><a href="login.lp?sessionid=]] .. url.escape(sessionid) ..
		[[" data-icon="home">home</a></li>
		<li><a href="register.lp" data-icon="arrow-u">register</a></li>
		</ul>
		</div>
		</div><!-- /头部 -->
		]]
	end
	return header_str
end


function header_user()
	local header_str
	
	header_str = [[
	<div data-role="header" data-position="fixed">
	<div data-role="navbar">
	<ul>
	<li><a href="user_index.lp" data-icon="home">首页</a></li>
	<li><a href="user_add_project.lp" data-icon="arrow-u">添加车辆</a></li>
	<li><a href="user_add_insurance.lp" data-icon="arrow-u">添加保单</a></li>
	</ul>
	</div>
	</div><!-- /头部 -->
	]]
	
	return header_str
end

function header_team(sessionid)
	local header_str
	if not sessionid then
		header_str = [[
		<div data-role="header" data-position="fixed">
		<div data-role="navbar">
		<ul>
		<li><a href="index.lp" data-icon="home">登录</a></li>
		<li><a href="register.lp" data-icon="arrow-u">注册</a></li>
		</ul>
		</div>
		</div><!-- /头部 -->
		]]
	else
		header_str = [[
		<div data-role="header" data-position="fixed">
		<div data-role="navbar">
		<ul>
		<li><a href="login.lp?sessionid=]] .. url.escape(sessionid) ..
		[[" data-icon="home">home</a></li>
		<li><a href="register.lp" data-icon="arrow-u">register</a></li>
		</ul>
		</div>
		</div><!-- /头部 -->
		]]
	end
	return header_str
end

pop_footer = [[
<div data-role="footer" data-position="fixed">
<h4>by gexiangying</h4>
<a href="#main" data-icon="arrow-l" class="ui-btn-left"></a>
</div><!-- /底部 --></div><!-- /页面 -->
]]

footer = [[
<div data-role="footer" data-position="fixed" class="ui-bar">
	<div data-role="navbar">
	<ul>
	<li><a href="user_index.lp" data-icon="home">首页</a></li>
	<li><a href="user_add_project.lp" data-icon="arrow-u">添加车辆</a></li>
	<li><a href="user_add_insurance.lp" data-icon="arrow-u">添加保单</a></li>
	</ul>
	</div>
<h4>辽ICP备 160001524</h4>
</div><!-- /底部 --></div><!-- /页面 -->
]]




function footer_login()
	local str	
	str = [[
<div data-role="footer" data-position="fixed" class="ui-bar">
	<div data-role="navbar">
	<ul>
		<li><a href="index.lp" data-icon="home">登录</a></li>
		<li><a href="register.lp" data-icon="arrow-u">注册</a></li>
	</ul>
	</div>
<h4>辽ICP备 160001524</h4>
</div><!-- /底部 --></div><!-- /页面 -->
	]]
	
	return str
end

function footer_main()
	local str	
	str = [[
<div data-role="footer" class="ui-bar">
	<div data-role="navbar">
	<ul>
		<li><a href="insurance_find.lp" data-icon="heart">三包服务</a></li>
	<!--	<li><a href="index_car.lp" data-icon="eye">平行进口车</a></li> -->
		<li><a href="index_car.lp" data-icon="eye">平行进口车</a></li> 
		<li><a href="designing.lp" data-icon="shop">二手车</a></li>
		<li><a href="index_me.lp" data-icon="user">我</a></li>
	</ul>
	</div>
<h4>辽ICP备 160001524</h4>
</div><!-- /底部 --></div><!-- /页面 -->
	]]
	
	return str
end


