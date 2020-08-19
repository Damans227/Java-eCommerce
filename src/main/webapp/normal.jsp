<%@page import="com.learn.mycart.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");


User user = (User)session.getAttribute("current-user");

if(user==null){
	
	session.setAttribute("message", "You are not logged in! Invalid credentials.");
	response.sendRedirect("login.jsp");
	return;
	
}
else{
	
	response.sendRedirect("checkout.jsp");
	
}

%>

</body>
</html>