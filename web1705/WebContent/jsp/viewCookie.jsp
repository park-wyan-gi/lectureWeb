<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>viewCookie</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies();
if( cookies != null && cookies.length >0 ){
	for(int i=0 ; i<cookies.length ; i++){
		Cookie c = cookies[i];
		out.print("<li> Name : " + c.getName());
		out.print("<li>Value : " + c.getValue());
		out.print("<li>Value : " + URLDecoder.decode(c.getValue(), "utf-8"));
	}
}

%>
</body>
</html>