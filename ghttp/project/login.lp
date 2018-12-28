<!DOCTYPE html>
<% 
	_G.package.loaded["project.base"] = nil 
	local base = _G.require("project.base") 

	_G.package.loaded["project.mgr_session"] = nil 
	local mgr_session = _G.require("project.mgr_session") 
	
	%>
<html>
<head>
<title>登陆管理系统</title>
	<%=base.head %>
</head>
<body>
 <div data-role="page">
			<h1 align="center">欢迎进入！</h1>	
	 <div data-role="content">
		 <form action="login_judge.lp" method="post">
			<ul data-role="listview" data-insert="true">
				<li data-role="fieldcontain">
					<label for="user">用户名称</label>
						<input type = "text" name = "user" id="user">
				</li>
				<li data-role="fieldcontain">
					<label for="psw">密码</label>
					<input type="password" name="psw" id = "psw">
				</li>
				<li data-role="fieldcontain">
					<input type = "submit" value = "确认" data-theme="b">
				</li>
		</form>

	 </div>
	 <%=base.footer_main() %>
 </div>
</body>
</html>
