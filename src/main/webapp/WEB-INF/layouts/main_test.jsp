<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
request.setAttribute("path",path);
request.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>SiteMesh example: <sitemesh:write property='title' /></title>
<link href="${requestScope.basePath}css/layout1.css" rel="stylesheet"
	type="text/css" />
<sitemesh:write property='head' />
<base href="<%=basePath%>">
</head>
<body>
	<div id="container">
		<div id="header">This is the Header</div>
		<br class="clearfloat" />
		<div id="menu">This is the Menu</div>
		<br class="clearfloat" />
		<div id="mainContent">
			<div id="sidebar">
				This is the sidebar<br /> <br /> <br /> <br /> <br /> <br /> <br />
				<br /> <br /> <br /> <br /> <br />
			</div>
			<div id="content">
				<sitemesh:write property='body' />
			</div>
		</div>
		<br class="clearfloat" />
		<div id="footer">
			This is the footer<span style="display: none"><script
					language="javascript" type="text/javascript"
					src="http://js.users.51.la/1967272.js"></script></span>
		</div>
	</div>
</body>
</html>