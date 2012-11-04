<%@ page language="java" import="java.util.*" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/eltag" prefix="el" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<c:forEach var="user" items="${userList}">
	<spring:message code="Username"/>: ${user.username} ; <spring:message code="Password"/>: ${user['password']};
	<spring:message code="relationship" />: 
	<c:forEach items="${t_relationship}" var="item">
		<c:if test="${el:bitAnd(user['relationship_seek'], item.key) > 0 }">${item.value },</c:if>
	</c:forEach>
	; 
	<spring:message code="ethnicity"/>:
	<c:forEach items="${t_ethnicity}" var="item">
		<c:if test="${item.key == user['ethnicity'] }">${item.value }</c:if>
	</c:forEach>
	;
	<br>
</c:forEach>
</body>
</html>