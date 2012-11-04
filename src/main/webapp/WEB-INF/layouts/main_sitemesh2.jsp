<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>	
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String cur_path = request.getContextPath() + request.getServletPath();
request.setAttribute("path",path);
request.setAttribute("basePath",basePath);
request.setAttribute("cur_path",cur_path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>SiteMesh example: <decorator:title default="sitemesh2 default title" /></title>
<link href="${requestScope.basePath}css/layout1.css" rel="stylesheet"
	type="text/css" />
<decorator:head />
<base href="<%=basePath%>">
</head>
<body>
	<div id="container">
		<div id="header"><page:applyDecorator page="/WEB-INF/decorators/header.jsp" name="header" /></div>
		<br class="clearfloat" />
		<div id="menu"><page:applyDecorator page="/WEB-INF/decorators/top_menu.jsp" name="top_menu" /></div>
		<br class="clearfloat" />
		<div id="mainContent">
			<div id="sidebar">
				<page:applyDecorator page="/WEB-INF/decorators/left.jsp" name="left" />
			</div>
			<div id="content">
				<decorator:body />
			</div>
		</div>
		<br class="clearfloat" />
		<div id="footer">
			<page:applyDecorator page="/WEB-INF/decorators/footer.jsp" name="footer" />
		</div>
	</div>
</body>
</html>