<%@ page language="java" import="java.util.*" contentType="text/html; utf-8"
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<base href="<%=basePath%>">  
</head>
<body>
<img src="${requestScope.basePath}images/jk.jpg" /><br>
basePath: el ${requestScope.basePath} : <%=basePath%><br>
basePath: el ${requestScope.path} : <%=path%><br>
你好:<%=request.getAttribute("loginUser") %>, El: ${loginUser}  ，现在时间是<%= new Date() %> 
<br>
ID: <%=request.getAttribute("loginUserId") %>, El: ${loginUserId}
<br>
Say: <%=request.getAttribute("loginUserSay") %>, El: ${loginUserSay}
</body>
</html>