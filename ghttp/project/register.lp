<!DOCTYPE html>
<% _G.package.loaded["project.base"] = nil %>
<% local project = _G.require("project.base") %>
<html>
	<head>
		<title>register</title>
		<%=project.head %>
	</head>
	<body>
		<div data-role="page">
			<%=project.header() %>
			<div data-role="content">
				<form action="reg.lp" method="post">
					<ul data-role="listview" data-insert="true">
						<li data-role="fieldcontain">
							<label for="user">username:</label>
								<input type = "text" name = "user" id="user">
						</li>
						<li data-role="fieldcontain">
							<label for="pass">passwd:</label>
								<input type="password" name="pass" id = "pass">
						</li>
						<li data-role="fieldcontain">
							<label for="email">email:</label>
								<input type="email" name="email" id = "email">
						</li>
						<li data-role="fieldcontain">
							<label for="phone">phone:</label>
								<input type = "text" name = "phone" id="phone">
						</li>
						<li data-role="fieldcontain">
							<input type = "submit" value = "确认" data-theme="b">
						</li>
					</ul>
				</form>
			</div>
			<%=project.footer %>
		</div>
	</body>
</html>
